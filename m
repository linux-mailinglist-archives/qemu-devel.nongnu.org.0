Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028336FE68
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:22:11 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVu6-0005AL-8k
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVdo-000155-Uy; Fri, 30 Apr 2021 12:05:22 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVdk-000684-UX; Fri, 30 Apr 2021 12:05:20 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKKIZ-1lrhH81RSZ-00LlcI; Fri, 30 Apr 2021 18:05:09 +0200
Subject: Re: [PATCH v2] ui: Fix memory leak in qemu_xkeymap_mapping_table()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210430155009.259755-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e1d3fe58-acad-3923-6614-2a69860864cb@vivier.eu>
Date: Fri, 30 Apr 2021 18:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430155009.259755-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i+Yna9ZMEteGs/MzzLqpQd6RJc9rwuUzdxqx8Q93icJTOBLi4+Q
 8ZxbPD1bnspnK/9qTFfd2pLf33u8bQ0eGfzYQxxGfD5qxU/m9Ebsb49aGu/IcppmhnT6i2U
 o5Q4COZZxETaMakGy9tQCF7nZ4K9TdRMoVLFs+cAieeHAOlD9pWy6PaAg6oM93qoOdXhRWn
 Y9utm/7AFT9z9x1luACUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2QYC+Gzzo9I=:rnG+wh/DiR1waqEr7kSekf
 zw2xI4gy345iJ4rgjaNGJq9MlTTtUQbRn+qvyewPO2hizzCZY14cZAC82Q+5QAi0haDnvwzZ0
 mi0QiNvD09mEef1po1xNXW7zpe0lMDD4XCPmLBl6Q5eiSpQrP/JXLn+sTiQtD0zh/or6KD5yT
 Ltbl3mII+mUBSKtTJyi0YYwVZzGlWV5FhOM0oGRl8tRaE/qV7KXkzpkR7/0IVI3n6p/T/yYfZ
 F8MCkT+8ftktGaK5Qpq3Vr8+3dJhEXWJOVAh9XwITseZHVxLRVAZCw3q2ExjjapdW+ugVf5RB
 2Q2XjKbMGxSOXuUiCH0DTD8x4kJiEQPJsyRokD9vdroH6cKnIs6Nl5FFUOHTjxXn5SGSH/1rf
 Xp+p7Q/G1evfO6nLw8zyzcqPrK1EEUVvnQrjt7X10kA52tIr7nWp0UujPUAhBjDLyjFLKvSaf
 Dv8vr4AAs3pj72oDZDPZ2TOFJHe0AX2u7CPs/QDGhn0YR6ZN8SOaCmJx1nWQYiOATbZ5rPIDy
 LOOaZr8tznLAr66tVTgijg=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2021 à 17:50, Philippe Mathieu-Daudé a écrit :
> Refactor qemu_xkeymap_mapping_table() to have a single exit point,
> so we can easily free the memory allocated by XGetAtomName().
> 
> This fixes when running a binary configured with --enable-sanitizers:
> 
>   Direct leak of 22 byte(s) in 1 object(s) allocated from:
>       #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
>       #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)
> 
> Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  ui/x_keymap.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

