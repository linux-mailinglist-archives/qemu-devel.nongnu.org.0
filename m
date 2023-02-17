Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3E69ACB5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT0z1-00058C-WC; Fri, 17 Feb 2023 08:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pT0yt-000532-Hr; Fri, 17 Feb 2023 08:40:55 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pT0yq-0000oL-Gf; Fri, 17 Feb 2023 08:40:54 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0B3B947713;
 Fri, 17 Feb 2023 14:40:47 +0100 (CET)
Message-ID: <85488658-80df-f6ac-8a1d-51172148a436@proxmox.com>
Date: Fri, 17 Feb 2023 14:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Lost partition tables on ide-hd + ahci drive
Content-Language: en-US
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Aaron Lauterer <a.lauterer@proxmox.com>
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
 <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.256,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 16.02.23 um 15:17 schrieb Mike Maslenkin:
> Does additional comparison make a sense here: check for LBA == 0 and
> then check MBR signature bytes.
> Additionally it’s easy to check buffer_is_zero() result or even print
> FIS contents under these conditions.
> Data looks like a part of guest memory of 64bit Windows.

Just today we got a new dump [0], and it's very similar. Again only 512
bytes and again guest memory?

> febner@enia ~/Downloads % hexdump -C dump.raw 
> 00000000  00 03 22 00 4e 74 46 73  da 4c a3 1c 3b f5 7d 19  |..".NtFs.L..;.}.|
> 00000010  60 a5 a6 d4 0c a8 ff ff  30 15 d9 e6 0c a8 ff ff  |`.......0.......|
> 00000020  5c 00 53 00 6f 00 66 00  74 00 77 00 61 00 72 00  |\.S.o.f.t.w.a.r.|
> 00000030  65 00 44 00 69 00 73 00  74 00 72 00 69 00 62 00  |e.D.i.s.t.r.i.b.|
> 00000040  75 00 74 00 69 00 6f 00  6e 00 5c 00 44 00 6f 00  |u.t.i.o.n.\.D.o.|
> 00000050  77 00 6e 00 6c 00 6f 00  61 00 64 00 5c 00 37 00  |w.n.l.o.a.d.\.7.|
> 00000060  33 00 63 00 36 00 33 00  65 00 32 00 64 00 37 00  |3.c.6.3.e.2.d.7.|
> 00000070  66 00 66 00 38 00 66 00  36 00 35 00 31 00 31 00  |f.f.8.f.6.5.1.1.|
> 00000080  39 00 36 00 63 00 65 00  61 00 31 00 65 00 30 00  |9.6.c.e.a.1.e.0.|
> 00000090  39 00 66 00 66 00 36 00  32 00 30 00 65 00 5c 00  |9.f.f.6.2.0.e.\.|
> 000000a0  69 00 6e 00 73 00 74 00  5c 00 70 00 61 00 63 00  |i.n.s.t.\.p.a.c.|
> 000000b0  6b 00 61 00 67 00 65 00  5f 00 39 00 31 00 37 00  |k.a.g.e._.9.1.7.|
> 000000c0  31 00 5f 00 66 00 6f 00  72 00 5f 00 6b 00 62 00  |1._.f.o.r._.k.b.|
> 000000d0  35 00 30 00 32 00 32 00  38 00 33 00 38 00 7e 00  |5.0.2.2.8.3.8.~.|
> 000000e0  33 00 31 00 62 00 66 00  33 00 38 00 35 00 36 00  |3.1.b.f.3.8.5.6.|
> 000000f0  61 00 64 00 33 00 36 00  34 00 65 00 33 00 35 00  |a.d.3.6.4.e.3.5.|
> 00000100  7e 00 61 00 6d 00 64 00  36 00 34 00 7e 00 7e 00  |~.a.m.d.6.4.~.~.|
> 00000110  31 00 30 00 2e 00 30 00  2e 00 31 00 2e 00 31 00  |1.0...0...1...1.|
> 00000120  33 00 2e 00 63 00 61 00  74 00 1d 08 0d a8 ff ff  |3...c.a.t.......|
> 00000130  13 03 0f 00 4e 74 46 73  ea 4d a3 1c 3b f5 7d 19  |....NtFs.M..;.}.|
> 00000140  90 05 4d 0f 0d a8 ff ff  a0 0c 55 0d 0d a8 ff ff  |..M.......U.....|
> 00000150  43 52 4f 53 4f 46 54 2d  57 49 4e 44 4f 57 53 2d  |CROSOFT-WINDOWS-|
> 00000160  44 2e 2e 2d 57 49 4e 50  52 4f 56 49 44 45 52 53  |D..-WINPROVIDERS|
> 00000170  2d 41 53 53 4f 43 5f 33  31 42 46 33 38 35 36 41  |-ASSOC_31BF3856A|
> 00000180  0c 03 67 00 70 00 73 00  63 00 72 00 69 00 70 00  |..g.p.s.c.r.i.p.|
> 00000190  74 00 2e 00 65 00 78 00  65 00 37 00 36 00 34 00  |t...e.x.e.7.6.4.|
> 000001a0  37 00 62 00 33 00 36 00  30 00 30 00 63 00 64 00  |7.b.3.6.0.0.c.d.|
> 000001b0  65 00 30 00 34 00 31 00  35 00 39 00 35 00 32 00  |e.0.4.1.5.9.5.2.|
> 000001c0  31 00 2e 00 74 00 6d 00  70 00 47 00 50 00 53 00  |1...t.m.p.G.P.S.|
> 000001d0  43 00 52 00 49 00 50 00  54 00 2e 00 45 00 58 00  |C.R.I.P.T...E.X.|
> 000001e0  45 00 37 00 36 00 34 00  37 00 42 00 33 00 36 00  |E.7.6.4.7.B.3.6.|
> 000001f0  30 00 30 00 43 00 44 00  45 00 30 00 34 00 31 00  |0.0.C.D.E.0.4.1.|
> 00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00100000

[0]:
https://forum.proxmox.com/threads/not-a-bootable-disk-vm-ms-server-2016.122849/post-534473


