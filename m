Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22AB6996C7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSext-0003ok-Td; Thu, 16 Feb 2023 09:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSexk-0003k5-Tx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pSexh-0000k5-9S
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676556607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=J2UtZHHNcCL1a5Trxgl6jaRffR/kp1y1luDcYZkhtadQcEMvTe9wo0fp1FU+cCZvA4j+qN
 KcLFK+etnVAQgFgbaLohPloO8JZbbEOTvThNCyikd+8HvlBJ8RgavF2CJpqZkVoLAO+YcU
 QyAEy3O/sxp0i8RgIQQx2WOdcxhr4Tw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-1gW7OrpoMUejxWRtNMDimg-1; Thu, 16 Feb 2023 09:10:05 -0500
X-MC-Unique: 1gW7OrpoMUejxWRtNMDimg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i1-20020adfa501000000b002c54aaa28dcso259332wrb.16
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OsTPntWEym5+6qxPln23WFSFRkwtALciwZ2GB3Po8oQBHtUfiLkUCRp71MN/ilKTnN
 ESlMnHND1GvUSYouY8mUPlHYd68HDzdkrskXtmzmhViV8dlvLHKR1l5QPufVO+zhiYmi
 5ZF/WyTqzzEpcEis2R+9VuVVlQoABKdUntGVOrrUgKgMOZJ2ZXFwvEhEBc6BCH/3AtWj
 TpILPsbdpM3hpSRqb+ZhfHcGyiQctcr6v7WTlj62vKOdTPe/K3m/LqB0fpgWlHqCV4cU
 Al+jzN83nD8cI4lrGUaSp8e4HPrURzs7qHUu2pU26i46prVO8WQzentG8GYD4ODu95hS
 ZmDw==
X-Gm-Message-State: AO0yUKUNIoEJR2udiqfTTHrsPvBo0D8ofEvp9WHVW60YSYqkwSWS5EQv
 ne3D7+iwRV1C3JDXCjjSd2Ca2JlqMDtt8EfMGoEf4/rtuIJXhfbaT5mli6lhgP74U4MXhQ/vqiq
 TJIm7fHFJFfqA+zw=
X-Received: by 2002:a05:600c:91d:b0:3e2:636:24ac with SMTP id
 m29-20020a05600c091d00b003e2063624acmr3809103wmp.14.1676556604601; 
 Thu, 16 Feb 2023 06:10:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/SYA1+GZfkP8HzQ8/PJsKW2MOipL12jYlGgYebckAcrHkhyNdv51apqkMBHsTYArtaIu2SsQ==
X-Received: by 2002:a05:600c:91d:b0:3e2:636:24ac with SMTP id
 m29-20020a05600c091d00b003e2063624acmr3809082wmp.14.1676556604318; 
 Thu, 16 Feb 2023 06:10:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c378200b003dfe5190376sm1847981wmr.35.2023.02.16.06.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:10:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode
Date: Thu, 16 Feb 2023 15:09:45 +0100
Message-Id: <20230216140945.164339-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230115012103.3131796-1-richard.henderson@linaro.org>
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


