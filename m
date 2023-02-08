Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4268F234
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmXT-0003fm-QW; Wed, 08 Feb 2023 10:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPmXS-0003fX-M1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPmXQ-0004iC-Sp
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675870751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MaHU+ZwYTtYPszjc86bm6WlTjmd1buLZb8Zn937nSfU=;
 b=R/PvyvsgVVqJ2rGHhw5wb1+1XAIUcU7NUfuti6uvFd9gRjuuN7doOMG5Ni0RSLHuDq+y/Z
 mD/QtDa7Bv0YBKSFJmF9xA9VGQda/qhDSGXdrIuFP3aDWlbaYJt7FctXoJqqAqecskYQCh
 fbHJiuiX3zm2ybxgtaJ0mcwpXtNYMdY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-rdD4unvmPHqGdFwLc_0MDQ-1; Wed, 08 Feb 2023 10:39:10 -0500
X-MC-Unique: rdD4unvmPHqGdFwLc_0MDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y11-20020a056402440b00b004aae9da824aso1748635eda.18
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 07:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MaHU+ZwYTtYPszjc86bm6WlTjmd1buLZb8Zn937nSfU=;
 b=1jXZfcBnCIZ7T3ZJcwwcBaiLQsfz5HmK5v4krY82eXNfCcQx9lOt6JbV9633TP4D44
 8nxyPaCPA3lWDvDGeXr3ayWCoy3NhoHi4mhPjfqTFeabHBdrCzYGOX/X7Ql+qDHGIssb
 4XQYMuPDg6mKzJEOjBWRyiU09T5VNGZTPQ30nthcGC4iD0nl6W3AXfI9xkckTYhd7UfH
 15+MKakYMKZ9UA7IDCUuQVjeJ55BJdowbVWDd2Ll2EoLgFQa9tqCc0C7cP1f4FO1Xkgy
 1XMESI3FNcLmFlNZmt5x1XciKe86pwc22sc9cPwMmEC59phphO2FUlLG0K49eYg7diTH
 OM7A==
X-Gm-Message-State: AO0yUKVeXsHJisvtXW51SgDJcnzK5vC1Wq4+Q/FLtekTG8e9NGzctSXt
 qO+SyKt3AOsvFxQ/PSDBMoTlAO2H4npeSUYetzff866icS9jAuOC67xjszhdkdlbg0B69BD78qQ
 zez/yqu1A3XToyAo=
X-Received: by 2002:a17:906:746:b0:854:6e3:2388 with SMTP id
 z6-20020a170906074600b0085406e32388mr8481400ejb.12.1675870748977; 
 Wed, 08 Feb 2023 07:39:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8juCdySNbzUjSvK0nzVcjxpIZYoX6JCAJzwPxSfxI9c4pcdBy0H82/xGlI1wwvdej2oXXudQ==
X-Received: by 2002:a17:906:746:b0:854:6e3:2388 with SMTP id
 z6-20020a170906074600b0085406e32388mr8481377ejb.12.1675870748784; 
 Wed, 08 Feb 2023 07:39:08 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 o18-20020a170906601200b008448d273670sm8332664ejj.49.2023.02.08.07.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 07:39:08 -0800 (PST)
Date: Wed, 8 Feb 2023 10:39:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <20230208103832-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
 <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Feb 08, 2023 at 09:26:28AM -0600, Tom Lendacky wrote:
> In any case, you'll need a version of the patch(es) that can be applied to
> the Qemu v7.2.0 tree to fix the regression.

For 7.2 I think it's best to backport
 eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
(since that's also a bugfix) then this on top.

-- 
MST


