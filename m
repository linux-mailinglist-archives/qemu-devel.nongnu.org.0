Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D33CB6BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:29:51 +0200 (CEST)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4M2Q-0001NE-EM
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4M1S-0000ht-4V
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:28:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35318
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4M1P-0000R0-Ol
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:28:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GB45WN156862; Fri, 16 Jul 2021 07:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=liTeCBXbVX5FjOjqvO9qeOG6JGWsnoqHYZah7NWnwbw=;
 b=mmD2uTmtVhDH8Hvsy1VoO9gXO0MtBwVCiGf9J8VdlniD1qkwj2WOypXP9z5ZGACpRhVy
 RZWVN78S2MN8tmJccyRAG1Q+00dMlFhPvzWq+sCiyoTJkT1L/COSxOockFn+50BE29Qj
 myJ5bjj0MD2JURx+3rCwYe1gQTu/Y6QhViZ1m4QNhzm0srdDaqXkP5bsKJxZrvw2ZJhO
 f4hA1ih3hEkEdVpWIfE/3h6WSo4z4zXuGGucsAQsNjNQt/NIQsUxcfTVDKLcVU7iStrQ
 vdmXkQTyiRvdkydGie62vfZZ3K8mbXRTNjFK/ajitIR4qtTaYZ+KBtuWKzYmeictHbpD ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rsyrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:28:31 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GB4HqD158098;
 Fri, 16 Jul 2021 07:28:30 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rsypt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:28:30 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GBSRrK029531;
 Fri, 16 Jul 2021 11:28:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p78v36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:28:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16GBQAFC16056710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 11:26:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66C9A404D;
 Fri, 16 Jul 2021 11:28:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B97FA405F;
 Fri, 16 Jul 2021 11:28:24 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.170.60])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 11:28:24 +0000 (GMT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
Message-ID: <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
Date: Fri, 16 Jul 2021 13:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OWWqjJQDAcsbMkalhsdcaRGDCrco0xEL
X-Proofpoint-ORIG-GUID: X77eN452N8N4kuqAg7OqodzmkgM5OGOk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160067
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16.07.21 08:54, Christian Borntraeger wrote:
> 
> On 12.07.21 14:26, Alex Bennée wrote:
>> Aside from a minor bloat to file size the ability to have TCG plugins
>> has no real impact on performance unless a plugin is actively loaded.
>> Even then the libempty.so plugin shows only a minor degradation in
>> performance caused by the extra book keeping the TCG has to do to keep
>> track of instructions. As it's a useful feature lets just enable it by
>> default and reduce our testing matrix a little.
>>
>> We need to move our linker testing earlier so we can be sure we can
>> enable the loader module required. As we have ruled out static &
>> plugins in an earlier patch we can also reduce the indent a little.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Message-Id: <20210709143005.1554-33-alex.bennee@linaro.org>
> 
> 
> I cant reproduce it manually but in our build regression this fails with

I can now reproduce when adding
  --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"
to the configure script (on "20.04.2 LTS)


----snip---
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 capstone slirp roms/SLOF
[1/1472] Linking target tests/plugin/libempty.so
FAILED: tests/plugin/libempty.so
cc  -o tests/plugin/libempty.so tests/plugin/libempty.so.p/empty.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libempty.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
/usr/bin/ld: tests/plugin/libempty.so.p/empty.c.o: in function `qemu_plugin_install':
/home/cborntra/REPOS/qemu/build/../tests/plugin/empty.c:30: undefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
collect2: error: ld returned 1 exit status
[2/1472] Linking target tests/plugin/libsyscall.so
FAILED: tests/plugin/libsyscall.so
cc  -o tests/plugin/libsyscall.so tests/plugin/libsyscall.so.p/syscall.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libsyscall.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
/usr/bin/ld: tests/plugin/libsyscall.so.p/syscall.c.o: in function `print_entry':
/home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:88: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libsyscall.so.p/syscall.c.o: in function `plugin_exit':
/home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:109: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libsyscall.so.p/syscall.c.o: in function `vcpu_syscall_ret':
/home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:76: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libsyscall.so.p/syscall.c.o: in function `vcpu_syscall':
/home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:55: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libsyscall.so.p/syscall.c.o: in function `qemu_plugin_install':
/home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:133: undefined reference to `qemu_plugin_register_vcpu_syscall_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:134: undefined reference to `qemu_plugin_register_vcpu_syscall_ret_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/syscall.c:135: undefined reference to `qemu_plugin_register_atexit_cb'
collect2: error: ld returned 1 exit status
[3/1472] Linking target tests/plugin/libinsn.so
FAILED: tests/plugin/libinsn.so
cc  -o tests/plugin/libinsn.so tests/plugin/libinsn.so.p/insn.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libinsn.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
/usr/bin/ld: tests/plugin/libinsn.so.p/insn.c.o: in function `plugin_exit':
/home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:58: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libinsn.so.p/insn.c.o: in function `vcpu_insn_exec_before':
/home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:29: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libinsn.so.p/insn.c.o: in function `vcpu_tb_trans':
/home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:37: undefined reference to `qemu_plugin_tb_n_insns'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:41: undefined reference to `qemu_plugin_tb_get_insn'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:44: undefined reference to `qemu_plugin_register_vcpu_insn_exec_inline'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:47: undefined reference to `qemu_plugin_insn_vaddr'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:48: undefined reference to `qemu_plugin_register_vcpu_insn_exec_cb'
/usr/bin/ld: tests/plugin/libinsn.so.p/insn.c.o: in function `qemu_plugin_install':
/home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:69: undefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/insn.c:70: undefined reference to `qemu_plugin_register_atexit_cb'
collect2: error: ld returned 1 exit status
[4/1472] Linking target tests/plugin/libmem.so
FAILED: tests/plugin/libmem.so
cc  -o tests/plugin/libmem.so tests/plugin/libmem.so.p/mem.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libmem.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
/usr/bin/ld: tests/plugin/libmem.so.p/mem.c.o: in function `plugin_exit':
/home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:39: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:39: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libmem.so.p/mem.c.o: in function `vcpu_tb_trans':
/home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:60: undefined reference to `qemu_plugin_tb_n_insns'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:64: undefined reference to `qemu_plugin_tb_get_insn'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:72: undefined reference to `qemu_plugin_register_vcpu_mem_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:67: undefined reference to `qemu_plugin_register_vcpu_mem_inline'
/usr/bin/ld: tests/plugin/libmem.so.p/mem.c.o: in function `vcpu_mem':
/home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:47: undefined reference to `qemu_plugin_get_hwaddr'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:48: undefined reference to `qemu_plugin_hwaddr_is_io'
/usr/bin/ld: tests/plugin/libmem.so.p/mem.c.o: in function `qemu_plugin_install':
/home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:109: undefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/mem.c:110: undefined reference to `qemu_plugin_register_atexit_cb'
collect2: error: ld returned 1 exit status
[5/1472] Linking target tests/plugin/libbb.so
FAILED: tests/plugin/libbb.so
cc  -o tests/plugin/libbb.so tests/plugin/libbb.so.p/bb.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libbb.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
/usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
/usr/bin/ld: tests/plugin/libbb.so.p/bb.c.o: in function `plugin_exit':
/home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:55: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:55: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libbb.so.p/bb.c.o: in function `vcpu_tb_trans':
/home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:84: undefined reference to `qemu_plugin_tb_n_insns'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:87: undefined reference to `qemu_plugin_register_vcpu_tb_exec_inline'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:89: undefined reference to `qemu_plugin_register_vcpu_tb_exec_inline'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:93: undefined reference to `qemu_plugin_register_vcpu_tb_exec_cb'
/usr/bin/ld: tests/plugin/libbb.so.p/bb.c.o: in function `vcpu_idle':
/home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:66: undefined reference to `qemu_plugin_outs'
/usr/bin/ld: tests/plugin/libbb.so.p/bb.c.o: in function `qemu_plugin_install':
/home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:134: undefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:135: undefined reference to `qemu_plugin_register_atexit_cb'
/usr/bin/ld: /home/cborntra/REPOS/qemu/build/../tests/plugin/bb.c:131: undefined reference to `qemu_plugin_register_vcpu_idle_cb'
collect2: error: ld returned 1 exit status
[6/1472] Generating qemu-version.h with a meson_exe.py custom command
ninja: build stopped: subcommand failed.

