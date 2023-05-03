Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31A6F5885
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:02:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puC6o-00013W-Am; Wed, 03 May 2023 09:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puC6j-0000mX-J5; Wed, 03 May 2023 09:01:21 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puC6g-00008A-2Z; Wed, 03 May 2023 09:01:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B70A2190B;
 Wed,  3 May 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683118873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AamY8doazuuSB2XXOx/A5+uLkbEsYAPZOmIMtzbPY0k=;
 b=cjtKlq8HlQRaWYlzDdVxRmp5nUBUB2pP5/UD/8mITOQwGSHKcVYYzRwluQYHt2T849cqc6
 aWWH6ML5Y5iQGNgMg5/DaS7RxR0jmAI1l6VDuyNDv5st5rjrS6ZhinK1LJqu/00Axx97K4
 +f2AdLZop26m3XaIyx8RSNSDNY24eb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683118873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AamY8doazuuSB2XXOx/A5+uLkbEsYAPZOmIMtzbPY0k=;
 b=h+INhXXqUGj9yWLZ3lMHWzfY+XGth9XgUpdElD/1ZEM4y0+uV9NfM1J36sXf8GE9YMkEZ4
 YYEYIrCDYERspHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96C1613584;
 Wed,  3 May 2023 13:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P2eyJBhbUmTBEQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 03 May 2023 13:01:12 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal
 <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 20/22] gitlab: enable minimal device profoile for
 aarch64 --disable-tcg
In-Reply-To: <20230503091244.1450613-21-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-21-alex.bennee@linaro.org>
Date: Wed, 03 May 2023 10:01:10 -0300
Message-ID: <87354dzi09.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> As this is likely the most common configuration people will want once
> the --disable-tcg patches land.

I don't think sbsa-ref works with KVM, sbsa_ref_init has:

    if (kvm_enabled()) {
        error_report("sbsa-ref: KVM is not supported for this machine");
        exit(1);
    }

