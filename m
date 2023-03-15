Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADF6BAE23
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOgu-00063H-CJ; Wed, 15 Mar 2023 06:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOgq-000632-M9
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOgp-0000VF-0Q
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OHEpOXqZSoDCDFAFz1JSxzALJ6bjWAaGfyC1SbPM8usjxB68yYGXWEmyRNHktM13RElOWn
 PMaflvlSUAU+SjYiHvSKAv8niqz/pg/9IGx4CmNJgbQusTPSyAo4uxphm9ciHHPQ0PcqTG
 4VwPdMQ1dlXtz7YxMced979e0YDaMtw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-5gi1ZOmCMOOjjOpwCSr8MA-1; Wed, 15 Mar 2023 06:48:59 -0400
X-MC-Unique: 5gi1ZOmCMOOjjOpwCSr8MA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l17-20020a05600c1d1100b003ed29ba093cso606708wms.6
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=O3H8SLE1UJmsQuyZzlw5DbP2qeNlcgenM/Q/vt8slGjKbAeS2AIvA3zFw0vM7ytIaG
 IH6zeK/UJr0WDLwGmvrMtMM95OF63oKYT24By3842ASXDXD4DZtmvTXOi/KJ8nDMG4+5
 3pzfqH89wIePAIuMkYypJTA8NPs113FWZSfJp0kGwifub/7r3+4hhomZ74qKyL7KPWBo
 v981yk3WSnol8IpL5ICB4DGJYN3J68D6Md5r5Nh//BPUYcCPDZXzADCz9+qEh/musS6k
 t31w9b7nchrYWFyt3/EAFKVqrFxZdrNwL45m+4W1rEsc3XOqswzFC5PH3EyuyrbNEaDR
 ranw==
X-Gm-Message-State: AO0yUKVCMy10+XJOZ2M6/Emqfqp+UjFC68b6YIv6GpXjoKIk9RVCF7YR
 MVD3PJJbdfZO0/jwJFAV6dA/EPNys7lM6+uvFyJ8PYaSTfEEIUjQymmqzEwWSDgABIDsV+3o/0R
 0I9YNrqxkZbHkp2I=
X-Received: by 2002:a05:600c:310e:b0:3e9:f15b:935b with SMTP id
 g14-20020a05600c310e00b003e9f15b935bmr18187770wmo.32.1678877338457; 
 Wed, 15 Mar 2023 03:48:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set9KR21j7XpTPmKAEhkPKN+gJvkuJNVYuJz2J+cUuPSaSYyFX0sGBXyaI1yRp/USVfKRU2XbfA==
X-Received: by 2002:a05:600c:310e:b0:3e9:f15b:935b with SMTP id
 g14-20020a05600c310e00b003e9f15b935bmr18187753wmo.32.1678877338161; 
 Wed, 15 Mar 2023 03:48:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a5d550b000000b002bfd524255esm4349486wrv.43.2023.03.15.03.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:48:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, hreitz@redhat.com,
 t.lamprecht@proxmox.com, d.csapak@proxmox.com, berrange@redhat.com
Subject: Re: [PATCH v2] vl: defuse PID file path resolve error
Date: Wed, 15 Mar 2023 11:48:56 +0100
Message-Id: <20230315104856.610945-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20221031094716.39786-1-f.ebner@proxmox.com>
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


