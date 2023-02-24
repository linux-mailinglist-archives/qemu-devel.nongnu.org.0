Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B816A18C1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:28:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUNV-0001QH-T6; Fri, 24 Feb 2023 04:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUN9-00018N-Er
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUN7-00044q-Q2
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677230889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Hirj5eQ1pRaOGZpuhUrQv9RFMI7PeeXvOfU9dbPh5j2wZg/hXURjbCj5VSamCgAyqeZ0La
 iVOYyfwetWdJZyhfne84eUky10/pt7k9z1hJgE586i7MV5Cg5WoFQDDNRRh/si/fqqn60Y
 ycgfUYtfO7EQqmaCIloP1UgrBC71KNQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-o9TwZp9_NOO817i2V3YEEg-1; Fri, 24 Feb 2023 04:27:59 -0500
X-MC-Unique: o9TwZp9_NOO817i2V3YEEg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ec13-20020a0564020d4d00b004a621e993a8so18605485edb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=PBCUrSHvxwEyIjNZ2mgVbmkMmGXZdqs5/ncgiEuwkMWRtO2LZlNcBmP/jLG7/oOHbn
 H3+JMT4ktBhNGF73jIvOCyPGfxEUz1/Me8fMYIZ4vrH8IxhQMH9TMJnPWW4EGlRMV5bT
 f2CfOCMZzWU1h5cZ8A6IsvtV1a7Q9IdhANtXcOEk+Z7EGJmiTZdRcoQ74WjJTLLjzoeG
 S2jsvjhvi09JG/1OPrbNe5nMWyuv02WEIfxvtDqIOiKrMY8E6tcOXDPQaofya730rbKk
 /X9G9yO4sC8od7JVAtLtPGeunOeJiGSv8OSTdHjcrpLPVhU8S8IpzY04VZd8FMZxCLbl
 ZOrA==
X-Gm-Message-State: AO0yUKVlyE9W1sxcRLTOBwcIbp5gJ1TwOtPfKl3oHVvy8SsbFWw4RoRc
 eIehaLAAQamjfQxLcqJNHZ4uc8/Xx4tdxgV6FubUZ4GVurC9Xoa4RpLw3Uin6dIupItuX3KmaGr
 FOFqZB/LD062mj5A=
X-Received: by 2002:a17:906:16d9:b0:886:221b:44e5 with SMTP id
 t25-20020a17090616d900b00886221b44e5mr21651746ejd.62.1677230878875; 
 Fri, 24 Feb 2023 01:27:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9dVChQ13OYiC7tZJhaId9LPQjRUq07UelBvCKWdZiFOwi60dnHBAZx13NqlauHGSPvPxnz7Q==
X-Received: by 2002:a17:906:16d9:b0:886:221b:44e5 with SMTP id
 t25-20020a17090616d900b00886221b44e5mr21651734ejd.62.1677230878537; 
 Fri, 24 Feb 2023 01:27:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a170906519500b008b2e4f88ed7sm9245882ejk.111.2023.02.24.01.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:27:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Cover RCU documentation
Date: Fri, 24 Feb 2023 10:27:56 +0100
Message-Id: <20230224092756.593742-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119102620.5669-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


