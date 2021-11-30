Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EF462EA0
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:36:43 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrycz-0001ee-OJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mryc1-0000te-OV
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:35:41 -0500
Received: from [2001:41c9:1:41f::167] (port=57266
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mrybz-0002EV-Pz
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:35:41 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1mrybi-0003hN-2m
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:35:28 +0000
To: qemu-devel <qemu-devel@nongnu.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
Date: Tue, 30 Nov 2021 08:35:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Odd square bracket encoding in QOM names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi all,

Has there been a recent change as to how square brackets are encoded within QOM 
names? I noticed that the output has changed here in the "info qom-tree" output in 
qemu-system-m68k for the q800 machine.

The q800 machine has a set of 256 memory region aliases that used to appear in the 
"info qom-tree" output as:

     /mac_m68k.io[100] (memory-region)
     /mac_m68k.io[101] (memory-region)
     /mac_m68k.io[102] (memory-region)

but they now appear as:

     /mac_m68k.io\x5b100\x5d[0] (memory-region)
     /mac_m68k.io\x5b101\x5d[0] (memory-region)
     /mac_m68k.io\x5b102\x5d[0] (memory-region)

Is there something that could cause the names to be double-encoded before being 
displayed?


ATB,

Mark.

