Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996C6A0ABB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBls-0007uJ-9T; Thu, 23 Feb 2023 08:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVBlq-0007ry-L9
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVBll-00076k-IG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=VgrUhW/seFewlE2Ov32WsXru9VdQVW0gtwbvt5pkundF9jY1tVv8VbUbfiRdedGbSII1+C
 edewCDnS5JqnvaJo5YGtzz3zeUMgDbutdrIiHDMSXELkeC7cZO8XE12gd/SEz4pJ5xK1qj
 S8lQ1lHqhbuX6KEGZYQndSKm0BPpu9w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-TYYF57bQNfmRVHgrNZcZDg-1; Thu, 23 Feb 2023 08:36:16 -0500
X-MC-Unique: TYYF57bQNfmRVHgrNZcZDg-1
Received: by mail-ed1-f71.google.com with SMTP id
 eg35-20020a05640228a300b004ad6e399b73so14039372edb.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=QUDK5FIySmsy5pMTc22izkX3JY4NAat0KAywZUmDiDw283Xo0NRGl9vS1/N800YPIQ
 ESSJmM/R3sr8vMCDB2Xr5XFdLa/Kqu7IrptDr5plizrM+5X9xytZf9XhCE4fevJFwxNc
 HaBwDm9ZixKqqDQ85GanHni+5fONJEoB3T0tObRR1y0cG4r0LoOF7e7wn8KrMOemxkpi
 djL2Dzdeuj3royYV/wdoRSqvwR9kIkw9f2sGI3CJo3OLgeKEOvOiVPGEIMaQcMIHX1mU
 Uhb5r4vmH03dhAv/w/j8C151W9qzCstrkUF4tLw9nRHiqSghqyOrTPkcweye2hKwxFxW
 cHsg==
X-Gm-Message-State: AO0yUKWX4nyw5zgUAnogcOCoR4RvZ6rysMnJddwEFXL394Ns6jvxq85t
 6BCsmnPQA6vMkDwyf471niQY8QQUA9WNykKWEPl8/+uuzk0twxuUoI23cdCSnFGqlIvFpuyPi9P
 tTzF4ZXhlCsQVKhQ=
X-Received: by 2002:a17:906:7fc8:b0:88d:5043:2299 with SMTP id
 r8-20020a1709067fc800b0088d50432299mr21721157ejs.51.1677159375836; 
 Thu, 23 Feb 2023 05:36:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9ckxQm5JVOMakskruWvl20d5UtUJPnzQMZjc7myhl6evEwBZxJSZ9nGRSEF2DXYMxpCMkljg==
X-Received: by 2002:a17:906:7fc8:b0:88d:5043:2299 with SMTP id
 r8-20020a1709067fc800b0088d50432299mr21721138ejs.51.1677159375596; 
 Thu, 23 Feb 2023 05:36:15 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170906714700b008b17b0f5d07sm8825595ejj.217.2023.02.23.05.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 05:36:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] meson: Avoid duplicates in generated config-poison.h again
Date: Thu, 23 Feb 2023 14:36:12 +0100
Message-Id: <20230223133612.555797-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206102037.3621709-1-armbru@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo


