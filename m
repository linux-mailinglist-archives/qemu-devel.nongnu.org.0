Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6251FF62
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:21:04 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4Fz-0002TP-7q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <moio@suse.com>)
 id 1no0Cd-00071A-JB; Mon, 09 May 2022 06:01:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <moio@suse.com>)
 id 1no0CX-0006Oo-6M; Mon, 09 May 2022 06:01:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B64C1F95E;
 Mon,  9 May 2022 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652090469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydQzRDb6iwbbAv2VTIpgVOP64VmAxI5xwyfRBKL3E0Q=;
 b=RhrqmYbNNHvgGd6DuUg08Mwq526rExE24RM7nM6uwXQvfclUBQTq2388SPlv+Km7U6gVj0
 ETpigRtsH0iwf7FO0o/9uUOgiU/kk8wvezsNiMUZtxnuxyBrU9T+f5L2DnijdPVfymTb8n
 RX051jSYhPbrRJrOWPqt8nlsnXol9tk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5BD7132C0;
 Mon,  9 May 2022 10:01:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pTOENmTmeGK6cAAAMHmgww
 (envelope-from <moio@suse.com>); Mon, 09 May 2022 10:01:08 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v5 06/16] hvf: Enable RDTSCP support
From: Silvio Moioli <moio@suse.com>
In-Reply-To: <20220214185605.28087-7-f4bug@amsat.org>
Date: Mon, 9 May 2022 12:01:08 +0200
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7EE836F-7B3C-493F-8BA9-6CC4718A91E1@suse.com>
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-7-f4bug@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: pass client-ip=195.135.220.29; envelope-from=moio@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 May 2022 10:16:49 -0400
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


> On 14 February, 2022, at 19:55, Philippe Mathieu-Daud=C3=A9 via =
<qemu-devel@nongnu.org> wrote:
>=20
> From: Cameron Esfahani <dirty@apple.com>
>=20
> Pass through RDPID and RDTSCP support in CPUID if host supports it.
> Correctly detect if CPU_BASED_TSC_OFFSET and CPU_BASED2_RDTSCP would
> be supported in primary and secondary processor-based VM-execution
> controls.  Enable RDTSCP in secondary processor controls if RDTSCP
> support is indicated in CPUID.
>=20
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Tested-by: Silvio Moioli <moio@suse.com>

in downstream Homebrew, see =
https://github.com/Homebrew/homebrew-core/pull/100645

Regards,
--
Silvio Moioli
SUSE Manager Development Team


