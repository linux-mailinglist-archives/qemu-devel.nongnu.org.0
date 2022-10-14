Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363705FF257
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:38:58 +0200 (CEST)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNi4-0000Zz-RT
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojNcl-0005r9-Ty
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojNcj-0007J6-Bj
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665765204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ueC5VTlD9srXw3nIH9njJ76Dcn6bg+Ch492X/b41lbA=;
 b=YoafgZH1HiohBn/Qw0oe6P8gMCLnVbb6L4vaq0G0MS4FOy08eWeVC+xtDCX2g04bJ8HZLl
 HFxd/r/4G0mrJ0cpRE9+bB+mFEvfdmiFGsUGeO6oZh9jp4Rp1+KLoYQ4WHkdHBNeIsDi23
 bMBE2O5gxa5x0/fn/11pVINLgIcdQtE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-VGA84GzaOzG5aQ98u1eoxA-1; Fri, 14 Oct 2022 12:33:20 -0400
X-MC-Unique: VGA84GzaOzG5aQ98u1eoxA-1
Received: by mail-qk1-f198.google.com with SMTP id
 t1-20020a05620a450100b006ee79ceeb6fso3831464qkp.11
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 09:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueC5VTlD9srXw3nIH9njJ76Dcn6bg+Ch492X/b41lbA=;
 b=fjwKESvfV3BcCRtLZAY8h0KuQYpQ1ytHSYVyAhe0zPxsYMqqbnhAjGMTg2mA5dDo3S
 ZKr6gWaC6cG2kK7y/Rp2wLPdSXYvkwAJIEgiBB4ERTZQWsT7/hsTUu8XH3822qtYGfFO
 co23wCeb8K0KVfSUAFzMYtl7Rgict1zTdtkCq8R73u226FsEb8ffnIyuUIEZ7qk0gySK
 d4t/5KaBffKJml/OtYogCqaNXxQuuGXQ1+d1w6mwozsPE1OKWDbcBI/AEAGC5T81BBrT
 eCbiwtHXpbES9DaR35w5audhxSkKoCwhD5mDPsGe1B35KFpK5nslzWSMJHl/RGE4nbZn
 pIFA==
X-Gm-Message-State: ACrzQf3EFx6LM+4mHeZddKhJKpCyKr9JABv1W/Ptq5W7XXI9dqatizF8
 2yZAOkWH/IKP6zw4LgdFfBB4TW5CwYVyh04QjvPx4x/zK0cykgPdgP/n4CFhsZb9vnFIijtf8a8
 5Jqeq66D2JZ9vrLa6xBfwFKgZeWsGruuOkQJjpYJanX47Vi61vxP8ixiNJto7Mf1O
X-Received: by 2002:ac8:7dc1:0:b0:35b:b42a:9bc6 with SMTP id
 c1-20020ac87dc1000000b0035bb42a9bc6mr4970758qte.243.1665765199400; 
 Fri, 14 Oct 2022 09:33:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cHI0AdQCqywC8nc51Vmq7sLhHOyLPSwkbOV6CtNdit+o9S1x2HvFROQEe+HidSi5vTRSQ/w==
X-Received: by 2002:ac8:7dc1:0:b0:35b:b42a:9bc6 with SMTP id
 c1-20020ac87dc1000000b0035bb42a9bc6mr4970737qte.243.1665765199121; 
 Fri, 14 Oct 2022 09:33:19 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05620a248400b006eeb185c209sm2943302qkn.50.2022.10.14.09.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 09:33:17 -0700 (PDT)
Date: Fri, 14 Oct 2022 12:33:15 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: dirty ring: Add memory barrier when marking pfn
 collected
Message-ID: <Y0mPS2wK45TqJABC@x1n>
References: <20220922213522.68861-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220922213522.68861-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Ping?


