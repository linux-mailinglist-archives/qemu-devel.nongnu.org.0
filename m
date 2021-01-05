Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE852EADEC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:09:17 +0100 (CET)
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwnxT-0007kr-TQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kwnvE-0006RF-62; Tue, 05 Jan 2021 10:06:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13978
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kwnvB-0007Ig-Hv; Tue, 05 Jan 2021 10:06:55 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 105F2fGD015957; Tue, 5 Jan 2021 10:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=y4zGknLTnl8GcpB0GhJvisXD7HMy9uXSbyCKWmfiS2c=;
 b=QCEdcobw3hY8pMJcTdXOvPjw/46LL3Zik6GDw9LQNKqfRbzWHF/OU3KsIygQtAY1mF/C
 efGS1h7BVkIJkfEoQKA1RycIyui05AQMtdYUL0VURH9e4cyNyfRC/DBgcguQ/mLR7x6L
 JHv0h5yJqd/K1OvztDzvr74bs/5pxChnek3brYohrf4qg8Cneq6SgyIHH8fZdOt0R6oJ
 0G4cLfkel6v+DpYR+PSQrP8AfbEwrYbxYmN5WhPB2m0+yNQpEv86TqE8dKU1yKrevHUN
 iHZcAc5hsjIpZw3PnslK0h8uizT4RU7TctLZ84b9beWyrE28qpaP6dm5DqWYmu7owdyG FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vt3r0wys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:06:50 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 105F2wSu016993;
 Tue, 5 Jan 2021 10:06:49 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vt3r0wxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:06:49 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 105F3d6v001215;
 Tue, 5 Jan 2021 15:06:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 35u3pmjc45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 15:06:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 105F6jko29163824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jan 2021 15:06:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C15AD11C050;
 Tue,  5 Jan 2021 15:06:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C97811C04A;
 Tue,  5 Jan 2021 15:06:45 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.80.251])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Jan 2021 15:06:45 +0000 (GMT)
Date: Tue, 5 Jan 2021 16:06:43 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
Message-ID: <20210105160643.395bef35.pasic@linux.ibm.com>
In-Reply-To: <20210105124405.15424-1-alex.bennee@linaro.org>
References: <20210105124405.15424-1-alex.bennee@linaro.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_03:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 Jan 2021 12:44:05 +0000
Alex Bennée <alex.bennee@linaro.org> wrote:

> The read binary data as text via a PPM export of the frame buffer
> seems a bit sketchy and it did blow up in the real world when the
> assertion failed:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/943183183
> 
> However short of cleaning up the test to be more binary focused at
> least limit the attempt to dump the whole file as hexified zeros in
> the logs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Acked-by: Halil Pasic <pasic@linux.ibm.com>

Thanks!

> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 0f81af9950..5141d6abb2 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -241,7 +241,7 @@ class S390CCWVirtioMachine(Test):
>              self.assertEqual(line, b"1024 768\n")
>              line = ppmfile.readline()
>              self.assertEqual(line, b"255\n")
> -            line = ppmfile.readline()
> +            line = ppmfile.readline(size=256)
>              self.assertEqual(line, b"The quick fox jumps over a lazy dog\n")
>  
>          # Hot-plug a virtio-crypto device and see whether it gets accepted


