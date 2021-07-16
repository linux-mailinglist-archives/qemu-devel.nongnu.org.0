Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAD3CB2E1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 08:56:42 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Hm5-00038h-5V
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 02:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4HkK-0002K8-Cp
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:54:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4HkH-0000mC-F1
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:54:52 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G6adfZ120690; Fri, 16 Jul 2021 02:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h7Ga/7p1dy+/D0FVvb5zi8qAspFlc2vFNtGfyeOB5pc=;
 b=qmnPj19Ofp2L2aQxvyIKza5POUfx8qjBCf2iOegNO7bpqs8lJQM7BjNjaPMsWh/Qj+6B
 voeS+P3Er+TXbZVwfgtQp6xt98XhHo44lB5v5FIrLQgLqJf9GU2c0lYOXI5RfTup76lB
 P2tQJyQL9SSpsSzn4P601sST7QarCBfmR0vmpJwkgwhY9pPqAZPxZ+wYetm7D7cFR6yS
 jSISuZYp4njFrzBt/d0vuceVn5oL/qMAgSYf35itG3GUF1JJnvg2aNJpr5oAcaQi2+Cj
 +//pudxzFnsgQa7MGDw3wjXKrsinf5pYN/CwaSfeVNLYWgPn9LGhsP/cF2akZd7SjtUk Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw4pargn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 02:54:29 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16G6bj3L127887;
 Fri, 16 Jul 2021 02:54:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw4parfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 02:54:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16G6m7Jb032743;
 Fri, 16 Jul 2021 06:54:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 39q368akcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 06:54:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16G6q9pS27459962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 06:52:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6204F4203F;
 Fri, 16 Jul 2021 06:54:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E192C42049;
 Fri, 16 Jul 2021 06:54:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.170.60])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 06:54:22 +0000 (GMT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
Date: Fri, 16 Jul 2021 08:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712122653.11354-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jHQTXESVqjVi95f691t9PKss4aVQvxQ0
X-Proofpoint-GUID: 2SEkhtsV-cdAsn3wD93bZSQ48cp16eLL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160037
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


On 12.07.21 14:26, Alex Bennée wrote:
> Aside from a minor bloat to file size the ability to have TCG plugins
> has no real impact on performance unless a plugin is actively loaded.
> Even then the libempty.so plugin shows only a minor degradation in
> performance caused by the extra book keeping the TCG has to do to keep
> track of instructions. As it's a useful feature lets just enable it by
> default and reduce our testing matrix a little.
> 
> We need to move our linker testing earlier so we can be sure we can
> enable the loader module required. As we have ruled out static &
> plugins in an earlier patch we can also reduce the indent a little.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20210709143005.1554-33-alex.bennee@linaro.org>


I cant reproduce it manually but in our build regression this fails with

     [769/2895] Linking target tests/plugin/libempty.so
     FAILED: tests/plugin/libempty.so
     cc  -o tests/plugin/libempty.so tests/plugin/libempty.so.p/empty.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libempty.so -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now -O2 -g -fPIE -DPIE -fstack-protector-strong -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -Wl,--end-group
     /usr/bin/ld: /usr/lib/gcc/s390x-linux-gnu/9/../../../s390x-linux-gnu/Scrt1.o: in function `_start':
     (.text+0x34): undefined reference to `main'
     /usr/bin/ld: tests/plugin/libempty.so.p/empty.c.o: in function `qemu_plugin_install':
     build/../tests/plugin/empty.c:30: undefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
     collect2: error: ld returned 1 exit status
     [770/2895] Generating edk2-arm-vars.fd with a meson_exe.py custom command
     [771/2895] Generating edk2-aarch64-code.fd with a meson_exe.py custom command
     [772/2895] Generating edk2-arm-code.fd with a meson_exe.py custom command
     [773/2895] Linking static target tests/fp/libsoftfloat.a
     [774/2895] Compiling C object tests/plugin/libinsn.so.p/insn.c.o
     [775/2895] Compiling C object tests/plugin/libsyscall.so.p/syscall.c.o
     [776/2895] Compiling C object tests/plugin/libmem.so.p/mem.c.o
     [777/2895] Compiling C object tests/plugin/libbb.so.p/bb.c.o
     [778/2895] Generating shared QAPI source files with a custom command
     [779/2895] Compiling C object libcapstone.a.p/capstone_arch_X86_X86DisassemblerDecoder.c.o
     [780/2895] Compiling C object libcapstone.a.p/capstone_arch_SystemZ_SystemZDisassembler.c.o
     ninja: build stopped: subcommand failed.
     make: *** [Makefile:154: run-ninja] Error 1


Not sure yet why and why I cant reproduce manually.

