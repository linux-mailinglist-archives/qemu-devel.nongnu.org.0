Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9058FA19
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:32:06 +0200 (CEST)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4Xs-0006Lu-7l
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4V6-00030k-1S; Thu, 11 Aug 2022 05:29:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4V2-0006P2-Vl; Thu, 11 Aug 2022 05:29:11 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B8Iwe7025720;
 Thu, 11 Aug 2022 09:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=x0uJbHb5fbHjADSOfaLJtBQZWJmpfowJfIskWDxmwq4=;
 b=HZrwLwQTsczt3ldxDyxnOh1rKqtKjB0oaE3qkewKrsQo1BB6KlU2tDjOAr53U/laNzcc
 TzfzBHpE7gO720cZkkkKAeMENyc6w7yRh+Nyu+9xZGQoVqg25hs9OsjeJdHMBKFGrrSf
 ObWuAvMjXNyCMQM/j1XLevGrbLk6BQhquEk7nBHWQVvpg85kd2tven7FTC+XFRRw3XSR
 HrkwqQ6rQKX8rFMBgFxhA/tSiSm1m9DFaQ7Dq0NYf8XwtRZP2/sSFxapQkuuy8ZNsu/Y
 mkC8dywwSqR2j0kiTg6V9JcvB4nCeTO6cMmOXSdKDayArLP9X17u9N0m4XP4npFol1vI 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvx59svd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:28:44 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B8K3b5029014;
 Thu, 11 Aug 2022 09:28:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvx59svc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:28:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9KUfj028809;
 Thu, 11 Aug 2022 09:28:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3hvdjurprn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:28:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27B9Sdi433227126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:28:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 548C04C044;
 Thu, 11 Aug 2022 09:28:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB3A64C040;
 Thu, 11 Aug 2022 09:28:38 +0000 (GMT)
Received: from [9.171.43.253] (unknown [9.171.43.253])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:28:38 +0000 (GMT)
Message-ID: <23d43d7cda9293eca9afbba91c50f613d004a407.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Thu, 11 Aug 2022 11:28:38 +0200
In-Reply-To: <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-2-iii@linux.ibm.com>
 <6e3e5974-15eb-05e8-a005-942884732fef@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hmTQwXIDh0XBnOppTpyMxlwp62qf1M_z
X-Proofpoint-GUID: 7fDV2wDdw94pXukZXE9IpDEXjy_EL2br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_04,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=805 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110026
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-10 at 13:29 -0700, Richard Henderson wrote:
> On 8/8/22 10:10, Ilya Leoshkevich wrote:
> > After mprotect(addr, PROT_NONE), addr can still be executed if
> > there
> > are cached translations. Drop them.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >   accel/tcg/translate-all.c | 17 ++++++++++++-----
> >   1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > index ef62a199c7..32ea5f0adf 100644
> > --- a/accel/tcg/translate-all.c
> > +++ b/accel/tcg/translate-all.c
> > @@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start,
> > target_ulong end, int flags)
> >            len != 0;
> >            len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
> >           PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS,
> > 1);
> > +        bool write_set, exec_cleared;
> >   
> > -        /* If the write protection bit is set, then we invalidate
> > -           the code inside.  */
> > -        if (!(p->flags & PAGE_WRITE) &&
> > -            (flags & PAGE_WRITE) &&
> > -            p->first_tb) {
> > +        /*
> > +         * If the write protection bit is set, then we invalidate
> > the code
> > +         * inside.
> > +         */
> > +        write_set = !(p->flags & PAGE_WRITE) && (flags &
> > PAGE_WRITE);
> > +        /*
> > +         * If PAGE_EXEC is cleared, we also need to invalidate the
> > code in
> > +         * order to force a fault when trying to run it.
> > +         */
> > +        exec_cleared = (p->flags & PAGE_EXEC) && !(flags &
> > PAGE_EXEC);
> > +        if ((write_set || exec_cleared) && p->first_tb) {
> 
> I believe the bug you're trying to fix is in get_page_addr_code,
> which for USER_ONLY is 
> currently a no-op.  It ought to be checking the page permissions
> there, as we do for softmmu.
> 
> I have a patch for get_page_addr_code in the works, because I was
> working on pther stuff 
> in the area.

How is qemu-user's get_page_addr_code() involved here?

I tried to experiment with it, and while I agree that it looks buggy,
it's called only from translation code paths. If we already have a
translation block, these code paths are not used.

