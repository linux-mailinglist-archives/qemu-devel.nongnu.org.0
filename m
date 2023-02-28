Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A16A5882
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyQe-0008V0-NN; Tue, 28 Feb 2023 06:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyQZ-0008SX-DO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyQT-000772-TZ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
 b=PUL8jjB/s5yd0j7B3EeLJ3hOZG+ASIcQhsDTKat4mz/DdCKwh9+aXCozH1mSMptABqA5aa
 fJ2A/fzkr9v/5Z1U6CniGAcdjjMp1KeRnA+IJa91jx2OM/JsWjJKp6hWbgSKpKHAzWJiCO
 cCaUl+zwTCFfrKYGvNggDVhYWLr0Yp8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-gQknTGjjNT-HihWm4BVOog-1; Tue, 28 Feb 2023 06:45:43 -0500
X-MC-Unique: gQknTGjjNT-HihWm4BVOog-1
Received: by mail-wm1-f71.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so2918577wmq.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677584742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
 b=CfQ80FkrWnHHAe/r4kK1bA/duaOUwRAnNgFbe3FgZNDPWUZ0TXimviCQx98SpoeNgp
 a8L8BwGMStxBxjAav0cowQszm5S1TjfcPZE0z57yeVlXXNZ+gdTANvgj41JzPx9c3+Yd
 bkllI2BvMSngEbJbwOIfyO2O2bSKs7vW0j5UJDZJ5Wqg69zvbpAl9j+GWpgfvmPUWO09
 mtQFiGb3vPiQ1Z8LM9pFCFylmILQ+Lr6o7ixyBeIcC6KD3rICr/e9Crw/qTAK+BANpnV
 kuDh9GQm8o1uGZsHP7V9rdWtzDsRd6zxYt2hFbRPBhRmRTHMkZEgwByPi9G8l/JCDHE9
 jtfQ==
X-Gm-Message-State: AO0yUKUkVEOhUN02SO9VkLMkQpoe0AmBHfXfTe1pOQpmJvLAjqHKjKvj
 EP8I4sRU94h4wlGcF7SJThO8kRqfjGyJIOuQaohgMiBzL8CMyE6iB0J8in1gqNPSc/l/WCLrmNs
 C2bnDQNiW8zY7En4=
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id
 i13-20020a5d558d000000b002c70694aa18mr1645856wrv.15.1677584742662; 
 Tue, 28 Feb 2023 03:45:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+48ZPIQtY97ItwCko/7jlopFQGD3BDNuOTQkv4JN9Zc5UzfllSrQJsmeRBXNl/Z16nZ9kf+Q==
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id
 i13-20020a5d558d000000b002c70694aa18mr1645837wrv.15.1677584742358; 
 Tue, 28 Feb 2023 03:45:42 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 q5-20020adff505000000b002c70a0e2cd0sm9735429wro.101.2023.02.28.03.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:45:41 -0800 (PST)
Date: Tue, 28 Feb 2023 06:45:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228064105-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <87h6v6gh1g.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6v6gh1g.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 12:34:19PM +0100, Markus Armbruster wrote:
> If it's not worth arguing, then we merge Thomas's patch.

I don't mind but it's just a doc patch isn't it? If what we want to do
is to stop doing make check on a 32 bit container and just to do
make then let's patch the relevant yaml.  I'd ack this, easy.

-- 
MST


