Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B322F85D5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:58:39 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VEz-0002Ib-LA
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l0VDN-0001QO-SD; Fri, 15 Jan 2021 14:56:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l0VDL-00015g-OD; Fri, 15 Jan 2021 14:56:57 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FJo8NE152459; Fri, 15 Jan 2021 14:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x1yuWFopzOBTa03aGAG8uHD9hoIUWCkyI02dzKsGHHY=;
 b=iLxIBV6JO0xKS/gvIBNq6k+XnMpSAe9HA9qlwPiILXdzeUOLpKrOyKPJWYtUFSVGZgFP
 S3SxqCHM+fAnOVG6P/6VWTZHGmdwoYtOx8g9o0NG0HU0skKgt4sAv6tKxyXzjtFOX29G
 f6TzQsyWCbcOQ3OM8zjztFeH2v2DoKg6h1vTPRkJbnQEkyIkEM9YXeZpoRMqQo3GRwen
 1dwu0P99x0hLaz5wcMMhmnIJZw8xs45G3t5hv4K2+hashm5bMmPqoS37WHqyyTX07+6w
 Qlri1kTj2jByoaikOrWn0fLrVMkt4em2SZDDLIqwMcJ14d/Tn1L/1H7a72IrvwnOoqHh sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363hjb84na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 14:56:48 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FJoT4L153487;
 Fri, 15 Jan 2021 14:56:48 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363hjb84mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 14:56:47 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FJbBin029632;
 Fri, 15 Jan 2021 19:56:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 35y449q2ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 19:56:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FJuknD26542378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:56:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57AA9112064;
 Fri, 15 Jan 2021 19:56:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43301112062;
 Fri, 15 Jan 2021 19:56:46 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 19:56:46 +0000 (GMT)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
From: Stefan Berger <stefanb@linux.ibm.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
 <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
 <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
 <1969c0a9-d2a0-35cd-98c9-93ec8c810a25@linux.ibm.com>
Message-ID: <6db4798d-9ec1-9d4a-424e-91ff33ef588e@linux.ibm.com>
Date: Fri, 15 Jan 2021 14:56:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1969c0a9-d2a0-35cd-98c9-93ec8c810a25@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_11:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150118
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 1:40 PM, Stefan Berger wrote:
> On 1/15/21 11:06 AM, Philippe Mathieu-Daudé wrote:
>> On 1/15/21 4:53 PM, Stefan Berger wrote:
>>> On 1/15/21 10:52 AM, Philippe Mathieu-Daudé wrote:
>>>> Subject is incorrect, this is not a removal of the tests, but
>>>> removal of their execution. The tests are still in the repository.
>>>> This is more of a disablement.
>>> How do you compile / run them to have the LeakSanitizer checks?
>> I used:
>>
>> ../configure --cc=clang --enable-sanitizers && make check-qtest
>>
>> $ clang -v
>> clang version 10.0.1 (Fedora 10.0.1-3.fc32)
>>
>> This was previously covered by patchew CI. I just figured
>> patchew is running without the LeakSanitizer since commit
>> 6f89ec7442e ("docker: test-debug: disable LeakSanitizer"):
>>
>>   docker: test-debug: disable LeakSanitizer
>>
>>   There are just too many leaks in device-introspect-test (especially 
>> for
>>   the plethora of arm and aarch64 boards) to make LeakSanitizer useful;
>>   disable it for now.
>>
> I only get short stack traces:
>
>
> Indirect leak of 852840 byte(s) in 207 object(s) allocated from:
>     #0 0x561a8c2f8b57 in calloc 
> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>     #2 0x561a8c4c2508 in json_parser_parse 
> /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
>     #3 0x561a8c4a99aa in json_message_process_token 
> /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
>     #4 0x561a8c4b6cfb in json_lexer_feed_char 
> /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
>
> Indirect leak of 6624 byte(s) in 207 object(s) allocated from:
>     #0 0x561a8c2f8b57 in calloc 
> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>
> Indirect leak of 1449 byte(s) in 207 object(s) allocated from:
>     #0 0x561a8c2f899f in malloc 
> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23f99f)
>     #1 0x14f096306958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>
> How can I see more of those?


I now added -fno-omit-frame-pointer to configure (should it not be 
there?) and it now shows some useful stacktraces.


diff --git a/configure b/configure
index 155dda124c..ed86b5ca32 100755
--- a/configure
+++ b/configure
@@ -5308,7 +5308,7 @@ if test "$gprof" = "yes" ; then
  fi

  if test "$have_asan" = "yes"; then
-  QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
+  QEMU_CFLAGS="-fsanitize=address -fno-omit-frame-pointer $QEMU_CFLAGS"
    QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
    if test "$have_asan_iface_h" = "no" ; then
        echo "ASAN build enabled, but ASAN header missing." \
diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c


This is my TPM related fix. Maybe it resolve the issue for you also?


index 5a33a6ef0f..b70cc32d60 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -250,7 +250,7 @@ void tpm_util_wait_for_migration_complete(QTestState 
*who)
          status = qdict_get_str(rsp_return, "status");
          completed = strcmp(status, "completed") == 0;
          g_assert_cmpstr(status, !=,  "failed");
-        qobject_unref(rsp_return);
+        qobject_unref(rsp);
          if (completed) {
              return;
          }

Now I see ppc64 related leaks:

Direct leak of 200 byte(s) in 1 object(s) allocated from:
     #0 0x14c9b743c837 in __interceptor_calloc (/lib64/libasan.so.6+0xb0837)
     #1 0x14c9b6e8b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
     #2 0x55c5e7130a1a in qemu_init_vcpu ../softmmu/cpus.c:618
     #3 0x55c5e68b30c0 in ppc_cpu_realize 
../target/ppc/translate_init.c.inc:10146
     #4 0x55c5e7539c08 in device_set_realized ../hw/core/qdev.c:761
     #5 0x55c5e714aa38 in property_set_bool ../qom/object.c:2255
     #6 0x55c5e7145d52 in object_property_set ../qom/object.c:1400
     #7 0x55c5e714f99f in object_property_set_qobject 
../qom/qom-qobject.c:28
     #8 0x55c5e71465f4 in object_property_set_bool ../qom/object.c:1470
     #9 0x55c5e666ae21 in spapr_realize_vcpu ../hw/ppc/spapr_cpu_core.c:254
     #10 0x55c5e666ae21 in spapr_cpu_core_realize 
../hw/ppc/spapr_cpu_core.c:337
     #11 0x55c5e7539c08 in device_set_realized ../hw/core/qdev.c:761
     #12 0x55c5e714aa38 in property_set_bool ../qom/object.c:2255
     #13 0x55c5e7145d52 in object_property_set ../qom/object.c:1400
     #14 0x55c5e714f99f in object_property_set_qobject 
../qom/qom-qobject.c:28
     #15 0x55c5e71465f4 in object_property_set_bool ../qom/object.c:1470
     #16 0x55c5e5c7553c in qdev_device_add ../softmmu/qdev-monitor.c:665
     #17 0x55c5e6fd4cc4 in device_init_func ../softmmu/vl.c:1201
     #18 0x55c5e78fc7bb in qemu_opts_foreach ../util/qemu-option.c:1147
     #19 0x55c5e6fc8912 in qemu_create_cli_devices ../softmmu/vl.c:2488
     #20 0x55c5e6fc8912 in qmp_x_exit_preconfig ../softmmu/vl.c:2527
     #21 0x55c5e6fcfb4b in qemu_init ../softmmu/vl.c:3533
     #22 0x55c5e5b18e78 in main ../softmmu/main.c:49
     #23 0x14c9b50fa041 in __libc_start_main (/lib64/libc.so.6+0x27041)

[..]


>
>
>    Stefan
>
>


