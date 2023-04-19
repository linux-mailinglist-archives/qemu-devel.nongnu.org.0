Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC246E81F5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:35:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDaM-0003WG-C7; Wed, 19 Apr 2023 15:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDaF-0003Vj-4W
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDaD-0002FX-Mw
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681932911;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F+aTdDIdhvUk8l+l9ptUAxEVa+LMAUOwrKZ2CcZDfkY=;
 b=YGD6xhh92MrGXB9JanAeshv0qusW4W4DkZIb6aQio9I7RjCY/nE5JA9yrHgW37SkbQON31
 jXAxtFNDMribqG4C+n29mhnK/tpIcybCQb3SoMJ867XwPj3FLaBQmfyIwKw1+OCpmFAaHL
 bmR2Tez99DPUvrJkYI59ot/ax9ucsV8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-reYoffdnM9irk9UDS49_UA-1; Wed, 19 Apr 2023 15:35:10 -0400
X-MC-Unique: reYoffdnM9irk9UDS49_UA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f92bd71f32so11081f8f.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681932909; x=1684524909;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+aTdDIdhvUk8l+l9ptUAxEVa+LMAUOwrKZ2CcZDfkY=;
 b=AItOGHGFLLgBNcz+H4uQ3pysCMPrVFFmgjVmX+eHZabg2yvFBzOlZNUoWhSr+C0a7v
 HqpNuQPyApza4eFSLsrwzRa82UvCoMFreyyGoFLp+KvIgAiGvdTE0VnVbcBTlpE15Z8W
 vnmxjteRVqoDenrLxsbQbCpvNqQneSDbTwB7Pt7iGqQKhzE5vXZ6O6/nxJ66Ae/9m8xK
 7TAlP9Lpc7Z4gkjBmeMmC3Qx0LuxQQoSh4wZvbaUMv6ZJLgIX2+d4yUeL889mKhml9D3
 flZKeTbDqd252uKrwo0zWAx5FWdxX4URuB0HW4tGmGeBuN77M3CVJhRK9w98vDMrpn49
 eLag==
X-Gm-Message-State: AAQBX9fx5hAA/5sB6luxbOxlfiAmufO9tgItbIg+PnAHeUlhxrqwl820
 4OPA2BZWjLxZEwW5TL46k47V8kHwFsEEqq2/VEq78gV/hBygdvt9p1oXXVekQp11c9LH6P+uc4/
 mvP2keejW+EaLsX8=
X-Received: by 2002:a5d:4150:0:b0:2c3:e7d8:245c with SMTP id
 c16-20020a5d4150000000b002c3e7d8245cmr5510216wrq.13.1681932908958; 
 Wed, 19 Apr 2023 12:35:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y28aYpocNulEZBRAf/v5qwMZYLjbax4O5NnA28VM6CeiNxQjAgNLAdW9I9wl7Ts118JstzJw==
X-Received: by 2002:a5d:4150:0:b0:2c3:e7d8:245c with SMTP id
 c16-20020a5d4150000000b002c3e7d8245cmr5510210wrq.13.1681932908649; 
 Wed, 19 Apr 2023 12:35:08 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iz14-20020a05600c554e00b003f175954e71sm3080518wmb.32.2023.04.19.12.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:35:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>,  David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/4] vl.c: Create late backends before migration object
In-Reply-To: <20230419161739.1129988-3-peterx@redhat.com> (Peter Xu's message
 of "Wed, 19 Apr 2023 12:17:37 -0400")
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 21:35:07 +0200
Message-ID: <877cu71x90.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> The migration object may want to check against different types of memory
> when initialized.  Delay the creation to be after late backends.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

We are moving late to early, not the best name O:-)


