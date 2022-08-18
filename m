Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0235980E6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:36:26 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObwv-0007bm-2v
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObph-0001vI-0f
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObpe-0002Z7-10
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660814928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=HvW92ugz4RNEaSrz9ChGCorp17ToMPkm3s0VZLBrUhiOn73LX2ALRLTZK3dSLrrT6xq85F
 ScqQLblzkV7jYfPcC5ud2msYlXA3jxt7uZz5uvF9gi7nvUafr4J2u8qRWJLPQOlfDjqJS4
 76SCDpaSyTnNbrfhuEcfW15Kbsd1wiU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-RRgb14dKOkG7DMhXUkBi3A-1; Thu, 18 Aug 2022 05:28:46 -0400
X-MC-Unique: RRgb14dKOkG7DMhXUkBi3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 y16-20020a056402359000b0043db5186943so618304edc.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=zRVuV2bSRQ5HCRiN4Ur/wwRMMYIZB1eeWM10ecWV1hkDPe67g/3616zTXkoqbG6aa0
 KcWM+cvJuvPJ7cOciO4RFsW0PePr1lFazNrbEC5AZl4qHtrtRMRcbUWCRzwfOay3lA2J
 tHpU7gPm9jCekNnpJUG+CDnRb3sRKjkeXwdIWRqJGFMk85rcqApbxNTZeFmyS22yY7KR
 l2HR0Jvi7gBGHqvzuKhayoMPzP1aDpp9XHCuh1nmHi12+Mk50oyno0mN/XXSGQRtdFC3
 3+raOjD9mhEqVRf85wdEvv2F5cUuGWQk0xU45ZN+3W7flqEQSnUkjjUXFaudajrxdy1h
 riAg==
X-Gm-Message-State: ACgBeo2IDoxQgLZXJZcDJ6HG7/tOReNNflliRGY7M7DpF64fO6NksoDU
 NHs3tgJe3e2kxFXiJgtrT6K2npgjU0UEt7136k2bG6wW3RGm16ueZQtb+gnANPDxPn7JeSFDeDL
 nxlZfClUo6YYevt4=
X-Received: by 2002:a17:906:58c9:b0:730:bc01:fd5f with SMTP id
 e9-20020a17090658c900b00730bc01fd5fmr1320319ejs.504.1660814925582; 
 Thu, 18 Aug 2022 02:28:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SCV62pvy8LAhPKvqlgyiaADdOD7HXJPUGBnf6u5F9KjhSYJqEeJ78W/9PvNmkRgTZYgh/ew==
X-Received: by 2002:a17:906:58c9:b0:730:bc01:fd5f with SMTP id
 e9-20020a17090658c900b00730bc01fd5fmr1320307ejs.504.1660814925386; 
 Thu, 18 Aug 2022 02:28:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q2-20020aa7d442000000b00445cf528bcdsm787160edr.86.2022.08.18.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:28:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] meson: be strict for boolean options
Date: Thu, 18 Aug 2022 11:28:42 +0200
Message-Id: <20220818092842.106378-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817143538.2107779-1-anton.kochkov@proton.me>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



