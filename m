Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B22CFFA0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 00:08:49 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klgfY-0004uy-Db
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 18:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1klge8-0003sy-0V; Sat, 05 Dec 2020 18:07:20 -0500
Received: from nwk-aaemail-lapp03.apple.com ([17.151.62.68]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1klge4-0004FW-4e; Sat, 05 Dec 2020 18:07:19 -0500
Received: from pps.filterd (nwk-aaemail-lapp03.apple.com [127.0.0.1])
 by nwk-aaemail-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 0B5N6DGr028914; Sat, 5 Dec 2020 15:07:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=JMB3YH2woue7RFzsAN2NjbdDAucIAR9Ud+Zna9WHtrQ=;
 b=E9UeTXaefw2QljoXNBNHLLpgxqKEV+RJdoyCpH1OvafYbyHZFS3X7KDPXGgpuDKnA2QY
 /Fvo5cnDb8Z2EdxVI1E31pwnaBm0QdcaZE9QzgYGefMIRlcHZb9q4fAsuYnY/1OJDtOw
 9SaYUJUlU9FaluMto5zGeK3xLQLA3guPSQSfnj79KGOapCsAs+DP4PbEDrIU24QAuaNC
 wOVBs7o4KocmeYrcaj11vkY7kpQh/vbdrK2ahFGo1j3OEqVg0KtMjIllp6oSmVlVBWQw
 tCKwzN3VvlI7Jmj3UDVBH6iVULn/HxppBVShdmaDANLq3QeEZxEbQx5jqOl/m8tmbkvM aA== 
Received: from rn-mailsvcp-mta-lapp02.rno.apple.com
 (rn-mailsvcp-mta-lapp02.rno.apple.com [10.225.203.150])
 by nwk-aaemail-lapp03.apple.com with ESMTP id 3587m6anxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 05 Dec 2020 15:07:11 -0800
Received: from rn-mailsvcp-mmp-lapp01.rno.apple.com
 (rn-mailsvcp-mmp-lapp01.rno.apple.com [17.179.253.14])
 by rn-mailsvcp-mta-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) with ESMTPS id <0QKW009LH2VZLP50@rn-mailsvcp-mta-lapp02.rno.apple.com>; 
 Sat, 05 Dec 2020 15:07:11 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp01.rno.apple.com by
 rn-mailsvcp-mmp-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) id <0QKW00Z002KA3I00@rn-mailsvcp-mmp-lapp01.rno.apple.com>; Sat,
 05 Dec 2020 15:07:11 -0800 (PST)
X-Va-A: 
X-Va-T-CD: b7acf4688ff5119976f07bf689c8d4e3
X-Va-E-CD: 82ceb44dab9739ac76e38818ef3348d0
X-Va-R-CD: e11c289b2eadeae8e6bef6a356323cd0
X-Va-CD: 0
X-Va-ID: 8b2ae447-714c-4f0b-9ebf-895d3aaf4853
X-V-A: 
X-V-T-CD: b7acf4688ff5119976f07bf689c8d4e3
X-V-E-CD: 82ceb44dab9739ac76e38818ef3348d0
X-V-R-CD: e11c289b2eadeae8e6bef6a356323cd0
X-V-CD: 0
X-V-ID: e9ef6796-eba3-4de7-99f3-81c821e86e4b
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-05_22:2020-12-04,
 2020-12-05 signatures=0
Received: from [17.234.67.92] (unknown [17.234.67.92])
 by rn-mailsvcp-mmp-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020))
 with ESMTPSA id <0QKW00BHV2VXHP00@rn-mailsvcp-mmp-lapp01.rno.apple.com>; Sat,
 05 Dec 2020 15:07:11 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <90AFD657-8B75-4D53-9D2A-51BE472C12E8@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_E5845046-D5D4-476B-8C8C-EE09D81879BC"
MIME-version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH 27/30] x86 hvf cpus: Fix Lesser GPL version number
Date: Sat, 05 Dec 2020 15:07:09 -0800
In-reply-to: <20201023124012.20035-1-chetan4windows@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
To: Chetan Pant <chetan4windows@gmail.com>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023124012.20035-1-chetan4windows@gmail.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-05_22:2020-12-04,
 2020-12-05 signatures=0
Received-SPF: pass client-ip=17.151.62.68; envelope-from=dirty@apple.com;
 helo=nwk-aaemail-lapp03.apple.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_E5845046-D5D4-476B-8C8C-EE09D81879BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Oct 23, 2020, at 5:40 AM, Chetan Pant <chetan4windows@gmail.com> =
wrote:
>=20
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
>=20
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
> target/i386/hvf/panic.h      | 2 +-
> target/i386/hvf/vmx.h        | 2 +-
> target/i386/hvf/x86.c        | 2 +-
> target/i386/hvf/x86.h        | 2 +-
> target/i386/hvf/x86_cpuid.c  | 2 +-
> target/i386/hvf/x86_decode.c | 2 +-
> target/i386/hvf/x86_decode.h | 2 +-
> target/i386/hvf/x86_descr.c  | 2 +-
> target/i386/hvf/x86_descr.h  | 2 +-
> target/i386/hvf/x86_emu.c    | 4 ++--
> target/i386/hvf/x86_emu.h    | 2 +-
> target/i386/hvf/x86_flags.c  | 2 +-
> target/i386/hvf/x86_flags.h  | 2 +-
> target/i386/hvf/x86_mmu.c    | 2 +-
> target/i386/hvf/x86_mmu.h    | 2 +-
> target/i386/hvf/x86hvf.c     | 2 +-
> target/i386/hvf/x86hvf.h     | 2 +-
> 17 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/i386/hvf/panic.h b/target/i386/hvf/panic.h
> index 411ef43..a3eabeb 100644
> --- a/target/i386/hvf/panic.h
> +++ b/target/i386/hvf/panic.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
> index 587b1b8..24c4cdf 100644
> --- a/target/i386/hvf/vmx.h
> +++ b/target/i386/hvf/vmx.h
> @@ -8,7 +8,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
> index fdb11c8..cd04518 100644
> --- a/target/i386/hvf/x86.c
> +++ b/target/i386/hvf/x86.c
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
> index bacade7..9e2c003 100644
> --- a/target/i386/hvf/x86.h
> +++ b/target/i386/hvf/x86.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 16762b6..ac731c2 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -7,7 +7,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_decode.c =
b/target/i386/hvf/x86_decode.c
> index 34c5e30..062713b 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_decode.h =
b/target/i386/hvf/x86_decode.h
> index ef79601..a2d7a2a 100644
> --- a/target/i386/hvf/x86_decode.h
> +++ b/target/i386/hvf/x86_decode.h
> @@ -4,7 +4,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
> index 8c05c34..9f539e7 100644
> --- a/target/i386/hvf/x86_descr.c
> +++ b/target/i386/hvf/x86_descr.c
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_descr.h b/target/i386/hvf/x86_descr.h
> index 049ef9a..c356932 100644
> --- a/target/i386/hvf/x86_descr.h
> +++ b/target/i386/hvf/x86_descr.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index d3e289e..da570e3 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> @@ -23,7 +23,7 @@
> //  This library is free software; you can redistribute it and/or
> //  modify it under the terms of the GNU Lesser General Public
> //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later =
version.
> //
> //  This library is distributed in the hope that it will be useful,
> //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_emu.h b/target/i386/hvf/x86_emu.h
> index f92a9c5..233f7b8 100644
> --- a/target/i386/hvf/x86_emu.h
> +++ b/target/i386/hvf/x86_emu.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c
> index 5ca4f41..fecbca7 100644
> --- a/target/i386/hvf/x86_flags.c
> +++ b/target/i386/hvf/x86_flags.c
> @@ -6,7 +6,7 @@
> //  This library is free software; you can redistribute it and/or
> //  modify it under the terms of the GNU Lesser General Public
> //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later =
version.
> //
> //  This library is distributed in the hope that it will be useful,
> //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_flags.h b/target/i386/hvf/x86_flags.h
> index 785e80c..75c2a7f 100644
> --- a/target/i386/hvf/x86_flags.h
> +++ b/target/i386/hvf/x86_flags.h
> @@ -6,7 +6,7 @@
> //  This library is free software; you can redistribute it and/or
> //  modify it under the terms of the GNU Lesser General Public
> //  License as published by the Free Software Foundation; either
> -//  version 2 of the License, or (at your option) any later version.
> +//  version 2.1 of the License, or (at your option) any later =
version.
> //
> //  This library is distributed in the hope that it will be useful,
> //  but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index 65d4603..882a623 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h
> index cd6e137..9ae8a54 100644
> --- a/target/i386/hvf/x86_mmu.h
> +++ b/target/i386/hvf/x86_mmu.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 5cbcb32..f267698 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -6,7 +6,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index 79539f7..860bd2e 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -5,7 +5,7 @@
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> =E2=80=94=20
> 2.17.1
>=20

Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>

Cameron Esfahani


--Apple-Mail=_E5845046-D5D4-476B-8C8C-EE09D81879BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Oct 23, 2020, at 5:40 AM, Chetan Pant &lt;<a =
href=3D"mailto:chetan4windows@gmail.com" =
class=3D"">chetan4windows@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">There =
is no "version 2" of the "Lesser" General Public License.<br class=3D"">It=
 is either "GPL version 2.0" or "Lesser GPL version 2.1".<br =
class=3D"">This patch replaces all occurrences of "Lesser GPL version 2" =
with<br class=3D"">"Lesser GPL version 2.1" in comment section.<br =
class=3D""><br class=3D"">Signed-off-by: Chetan Pant &lt;<a =
href=3D"mailto:chetan4windows@gmail.com" =
class=3D"">chetan4windows@gmail.com</a>&gt;<br class=3D"">---<br =
class=3D""> target/i386/hvf/panic.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 =
+-<br class=3D""> target/i386/hvf/vmx.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 =
+-<br class=3D""> target/i386/hvf/x86.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_cpuid.c &nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_decode.c | 2 +-<br class=3D""> =
target/i386/hvf/x86_decode.h | 2 +-<br class=3D""> =
target/i386/hvf/x86_descr.c &nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_descr.h &nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_emu.c &nbsp;&nbsp;&nbsp;| 4 ++--<br class=3D""> =
target/i386/hvf/x86_emu.h &nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_flags.c &nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_flags.h &nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_mmu.c &nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86_mmu.h &nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86hvf.c &nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
target/i386/hvf/x86hvf.h &nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D""> =
17 files changed, 18 insertions(+), 18 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/target/i386/hvf/panic.h =
b/target/i386/hvf/panic.h<br class=3D"">index 411ef43..a3eabeb 100644<br =
class=3D"">--- a/target/i386/hvf/panic.h<br class=3D"">+++ =
b/target/i386/hvf/panic.h<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">diff --git =
a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h<br class=3D"">index =
587b1b8..24c4cdf 100644<br class=3D"">--- a/target/i386/hvf/vmx.h<br =
class=3D"">+++ b/target/i386/hvf/vmx.h<br class=3D"">@@ -8,7 +8,7 @@<br =
class=3D""> &nbsp;* This program is free software; you can redistribute =
it and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c<br class=3D"">index =
fdb11c8..cd04518 100644<br class=3D"">--- a/target/i386/hvf/x86.c<br =
class=3D"">+++ b/target/i386/hvf/x86.c<br class=3D"">@@ -5,7 +5,7 @@<br =
class=3D""> &nbsp;* This program is free software; you can redistribute =
it and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h<br class=3D"">index =
bacade7..9e2c003 100644<br class=3D"">--- a/target/i386/hvf/x86.h<br =
class=3D"">+++ b/target/i386/hvf/x86.h<br class=3D"">@@ -5,7 +5,7 @@<br =
class=3D""> &nbsp;* This program is free software; you can redistribute =
it and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c<br =
class=3D"">index 16762b6..ac731c2 100644<br class=3D"">--- =
a/target/i386/hvf/x86_cpuid.c<br class=3D"">+++ =
b/target/i386/hvf/x86_cpuid.c<br class=3D"">@@ -7,7 +7,7 @@<br class=3D"">=
 &nbsp;* This program is free software; you can redistribute it =
and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c<br =
class=3D"">index 34c5e30..062713b 100644<br class=3D"">--- =
a/target/i386/hvf/x86_decode.c<br class=3D"">+++ =
b/target/i386/hvf/x86_decode.c<br class=3D"">@@ -5,7 +5,7 @@<br =
class=3D""> &nbsp;* This program is free software; you can redistribute =
it and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_decode.h b/target/i386/hvf/x86_decode.h<br =
class=3D"">index ef79601..a2d7a2a 100644<br class=3D"">--- =
a/target/i386/hvf/x86_decode.h<br class=3D"">+++ =
b/target/i386/hvf/x86_decode.h<br class=3D"">@@ -4,7 +4,7 @@<br =
class=3D""> &nbsp;* This program is free software; you can redistribute =
it and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c<br =
class=3D"">index 8c05c34..9f539e7 100644<br class=3D"">--- =
a/target/i386/hvf/x86_descr.c<br class=3D"">+++ =
b/target/i386/hvf/x86_descr.c<br class=3D"">@@ -5,7 +5,7 @@<br class=3D"">=
 &nbsp;* This program is free software; you can redistribute it =
and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_descr.h b/target/i386/hvf/x86_descr.h<br =
class=3D"">index 049ef9a..c356932 100644<br class=3D"">--- =
a/target/i386/hvf/x86_descr.h<br class=3D"">+++ =
b/target/i386/hvf/x86_descr.h<br class=3D"">@@ -5,7 +5,7 @@<br class=3D"">=
 &nbsp;* This program is free software; you can redistribute it =
and/or<br class=3D""> &nbsp;* modify it under the terms of the GNU =
Lesser General Public<br class=3D""> &nbsp;* License as published by the =
Free Software Foundation; either<br class=3D"">- * version 2 of the =
License, or (at your option) any later version.<br class=3D"">+ * =
version 2.1 of the License, or (at your option) any later version.<br =
class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is distributed =
in the hope that it will be useful,<br class=3D""> &nbsp;* but WITHOUT =
ANY WARRANTY; without even the implied warranty of<br class=3D"">diff =
--git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c<br =
class=3D"">index d3e289e..da570e3 100644<br class=3D"">--- =
a/target/i386/hvf/x86_emu.c<br class=3D"">+++ =
b/target/i386/hvf/x86_emu.c<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">@@ -23,7 +23,7 @@<br =
class=3D""> // &nbsp;This library is free software; you can redistribute =
it and/or<br class=3D""> // &nbsp;modify it under the terms of the GNU =
Lesser General Public<br class=3D""> // &nbsp;License as published by =
the Free Software Foundation; either<br class=3D"">-// &nbsp;version 2 =
of the License, or (at your option) any later version.<br class=3D"">+// =
&nbsp;version 2.1 of the License, or (at your option) any later =
version.<br class=3D""> //<br class=3D""> // &nbsp;This library is =
distributed in the hope that it will be useful,<br class=3D""> // =
&nbsp;but WITHOUT ANY WARRANTY; without even the implied warranty of<br =
class=3D"">diff --git a/target/i386/hvf/x86_emu.h =
b/target/i386/hvf/x86_emu.h<br class=3D"">index f92a9c5..233f7b8 =
100644<br class=3D"">--- a/target/i386/hvf/x86_emu.h<br class=3D"">+++ =
b/target/i386/hvf/x86_emu.h<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">diff --git =
a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c<br =
class=3D"">index 5ca4f41..fecbca7 100644<br class=3D"">--- =
a/target/i386/hvf/x86_flags.c<br class=3D"">+++ =
b/target/i386/hvf/x86_flags.c<br class=3D"">@@ -6,7 +6,7 @@<br class=3D"">=
 // &nbsp;This library is free software; you can redistribute it =
and/or<br class=3D""> // &nbsp;modify it under the terms of the GNU =
Lesser General Public<br class=3D""> // &nbsp;License as published by =
the Free Software Foundation; either<br class=3D"">-// &nbsp;version 2 =
of the License, or (at your option) any later version.<br class=3D"">+// =
&nbsp;version 2.1 of the License, or (at your option) any later =
version.<br class=3D""> //<br class=3D""> // &nbsp;This library is =
distributed in the hope that it will be useful,<br class=3D""> // =
&nbsp;but WITHOUT ANY WARRANTY; without even the implied warranty of<br =
class=3D"">diff --git a/target/i386/hvf/x86_flags.h =
b/target/i386/hvf/x86_flags.h<br class=3D"">index 785e80c..75c2a7f =
100644<br class=3D"">--- a/target/i386/hvf/x86_flags.h<br class=3D"">+++ =
b/target/i386/hvf/x86_flags.h<br class=3D"">@@ -6,7 +6,7 @@<br class=3D"">=
 // &nbsp;This library is free software; you can redistribute it =
and/or<br class=3D""> // &nbsp;modify it under the terms of the GNU =
Lesser General Public<br class=3D""> // &nbsp;License as published by =
the Free Software Foundation; either<br class=3D"">-// &nbsp;version 2 =
of the License, or (at your option) any later version.<br class=3D"">+// =
&nbsp;version 2.1 of the License, or (at your option) any later =
version.<br class=3D""> //<br class=3D""> // &nbsp;This library is =
distributed in the hope that it will be useful,<br class=3D""> // =
&nbsp;but WITHOUT ANY WARRANTY; without even the implied warranty of<br =
class=3D"">diff --git a/target/i386/hvf/x86_mmu.c =
b/target/i386/hvf/x86_mmu.c<br class=3D"">index 65d4603..882a623 =
100644<br class=3D"">--- a/target/i386/hvf/x86_mmu.c<br class=3D"">+++ =
b/target/i386/hvf/x86_mmu.c<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">diff --git =
a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h<br =
class=3D"">index cd6e137..9ae8a54 100644<br class=3D"">--- =
a/target/i386/hvf/x86_mmu.h<br class=3D"">+++ =
b/target/i386/hvf/x86_mmu.h<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">diff --git =
a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c<br class=3D"">index =
5cbcb32..f267698 100644<br class=3D"">--- a/target/i386/hvf/x86hvf.c<br =
class=3D"">+++ b/target/i386/hvf/x86hvf.c<br class=3D"">@@ -6,7 +6,7 =
@@<br class=3D""> &nbsp;* This program is free software; you can =
redistribute it and/or<br class=3D""> &nbsp;* modify it under the terms =
of the GNU Lesser General Public<br class=3D""> &nbsp;* License as =
published by the Free Software Foundation; either<br class=3D"">- * =
version 2 of the License, or (at your option) any later version.<br =
class=3D"">+ * version 2.1 of the License, or (at your option) any later =
version.<br class=3D""> &nbsp;*<br class=3D""> &nbsp;* This program is =
distributed in the hope that it will be useful,<br class=3D""> &nbsp;* =
but WITHOUT ANY WARRANTY; without even the implied warranty of<br =
class=3D"">diff --git a/target/i386/hvf/x86hvf.h =
b/target/i386/hvf/x86hvf.h<br class=3D"">index 79539f7..860bd2e =
100644<br class=3D"">--- a/target/i386/hvf/x86hvf.h<br class=3D"">+++ =
b/target/i386/hvf/x86hvf.h<br class=3D"">@@ -5,7 +5,7 @@<br class=3D""> =
&nbsp;* This program is free software; you can redistribute it and/or<br =
class=3D""> &nbsp;* modify it under the terms of the GNU Lesser General =
Public<br class=3D""> &nbsp;* License as published by the Free Software =
Foundation; either<br class=3D"">- * version 2 of the License, or (at =
your option) any later version.<br class=3D"">+ * version 2.1 of the =
License, or (at your option) any later version.<br class=3D""> =
&nbsp;*<br class=3D""> &nbsp;* This program is distributed in the hope =
that it will be useful,<br class=3D""> &nbsp;* but WITHOUT ANY WARRANTY; =
without even the implied warranty of<br class=3D"">=E2=80=94 <br =
class=3D"">2.17.1<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D"">Reviewed-by: Cameron Esfahani &lt;<a =
href=3D"mailto:dirty@apple.com" =
class=3D"">dirty@apple.com</a>&gt;</div><div class=3D""><br =
class=3D""></div><div class=3D"">Cameron Esfahani</div><div class=3D""><br=
 class=3D""></div></body></html>=

--Apple-Mail=_E5845046-D5D4-476B-8C8C-EE09D81879BC--

