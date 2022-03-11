Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E954D69FA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 23:31:55 +0100 (CET)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSnnd-0008ER-47
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 17:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSnli-0007NE-SV; Fri, 11 Mar 2022 17:29:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSnlg-0000pn-UD; Fri, 11 Mar 2022 17:29:54 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BLI2Id008623; 
 Fri, 11 Mar 2022 22:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : reply-to : subject : to : cc : references : from :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=cBb5ybSe5uc2CQzVch5BWLga8n7gwRnAnQK0zOrBJeo=;
 b=jk1EDsl6V2R1YNJUl/HcFHh0F4OvZuA4Lvkn8T3+Tf+srSeLbKsyzHJHvRi1DZnHvr2m
 ESURltd86WXg/SRaX41wKEt0QbpHMmlZoVJZNCjCxZz92Hfisy64W6VDLJNRORnTidsX
 AIKP4yv+YcEgcQm2NT++O5FNwirytNyAp0elyiUhI2SN/myXc2DBvBzDxkt9gcc/XeMu
 5YneWK/utVkzN7mIyz7+XCYPr5oh1GuQs+E2m6mze+zm3lV6tsJj8BMfzREADyLACNEv
 zMQqNd0z7f7nWkyatRIXE4ngg4381RMoacS6RTKHUSuqsjZ/TAX+gq2o70AFuPejhRHV RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqs92gfmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:29:50 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BMR9KL024593;
 Fri, 11 Mar 2022 22:29:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqs92gfma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:29:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BMDJF4017514;
 Fri, 11 Mar 2022 22:29:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3emgamkej0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 22:29:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22BMTkFZ27066702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 22:29:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E4387806A;
 Fri, 11 Mar 2022 22:29:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D46CA78069;
 Fri, 11 Mar 2022 22:29:44 +0000 (GMT)
Received: from [9.160.104.172] (unknown [9.160.104.172])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Mar 2022 22:29:44 +0000 (GMT)
Message-ID: <fe86ecbb-11f6-26c0-240b-cf5e8e99b15a@linux.ibm.com>
Date: Fri, 11 Mar 2022 19:29:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH] block-qdict: Fix -Werror=maybe-uninitialized build failure
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220310200511.44746-1-muriloo@linux.ibm.com>
 <87a6dwesuw.fsf@pond.sub.org>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <87a6dwesuw.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSXL7IQhiJJvqqGx5aAKkQDTbwcqkGP3
X-Proofpoint-ORIG-GUID: nKq3it3n8QnAlfN3Ekl-j-0_j1UjZW6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_09,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: muriloo@linux.ibm.com
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 mopsfelder@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Markus.

On 3/11/22 06:33, Markus Armbruster wrote:
> Murilo Opsfelder Araujo <muriloo@linux.ibm.com> writes:
> 
>> Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
>> following error:
>>
>>      $ ../configure --prefix=/usr/local/qemu-disabletcg --target-list=ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
>>      ...
>>      $ make -j$(nproc)
>>      ...
>>      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
>>      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -I/usr/include/lib
>>      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /root/qemu/linux-headers -isystem linux-headers -iquote
>>       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite
>>      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label
>>      s -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qobject_block-qdict.c.o.d -
>>      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdict.c
>>      In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
>>                       from /root/qemu/include/block/qdict.h:13,
>>                       from ../qobject/block-qdict.c:11:
>>      /root/qemu/include/qapi/qmp/qobject.h: In function ‘qdict_array_split’:
>>      /root/qemu/include/qapi/qmp/qobject.h:49:17: error: ‘subqdict’ may be used uninitialized [-Werror=maybe-uninitialized]
>>         49 |     typeof(obj) _obj = (obj);                                   \
>>            |                 ^~~~
>>      ../qobject/block-qdict.c:227:16: note: ‘subqdict’ declared here
>>        227 |         QDict *subqdict;
>>            |                ^~~~~~~~
>>      cc1: all warnings being treated as errors
>>
>> Fix build failure by initializing the QDict variable with NULL.
>>
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Hanna Reitz <hreitz@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> ---
>>   qobject/block-qdict.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
>> index 1487cc5dd8..b26524429c 100644
>> --- a/qobject/block-qdict.c
>> +++ b/qobject/block-qdict.c
>> @@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
>>       for (i = 0; i < UINT_MAX; i++) {
>>           QObject *subqobj;
>>           bool is_subqdict;
>> -        QDict *subqdict;
>> +        QDict *subqdict = NULL;
>>           char indexstr[32], prefix[32];
>>           size_t snprintf_ret;
> 
> The compiler's warning is actually spurious.  Your patch is the
> minimally invasive way to shut it up.  But I wonder whether we can
> make the code clearer instead.  Let's have a look:
> 
>             /*
>              * There may be either a single subordinate object (named
>              * "%u") or multiple objects (each with a key prefixed "%u."),
>              * but not both.
>              */
>             if (!subqobj == !is_subqdict) {
>                 break;
> 
> Because of this, ...
> 
>             }
> 
>             if (is_subqdict) {
> 
> ... subqobj is non-null here, and ...
> 
>                 qdict_extract_subqdict(src, &subqdict, prefix);
>                 assert(qdict_size(subqdict) > 0);
>             } else {
> 
> ... null here.
> 
>                 qobject_ref(subqobj);
>                 qdict_del(src, indexstr);
>             }
> 
>             qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
> 
> What about this:
> 
>             if (is_subqdict) {
>                 qdict_extract_subqdict(src, &subqdict, prefix);
>                 assert(qdict_size(subqdict) > 0);
>                 qlist_append_obj(*dst, subqobj);
>             } else {
>                 qobject_ref(subqobj);
>                 qdict_del(src, indexstr);
>                 qlist_append_obj(*dst, QOBJECT(subqdict));
>             }
> 

The logic looks inverted but I think I got what you meant.

I've sent a v2 with changes that made the compiler happy and also passed check-unit tests.

Thank you!

-- 
Murilo

