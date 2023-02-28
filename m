Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536926A572A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxaO-0007Ml-Rl; Tue, 28 Feb 2023 05:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWxaM-0007MJ-Br
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWxaK-00050H-Vr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677581512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
 b=aBB1oLWK3UvEyXIN0NzzVXKrjS/jgJxrR1Wkcrfja+zZjN6dSQDCW0i23a3AGrCO0EgKlH
 e6QLrwpWt1ukkoZzJ2CjNck/fruGw8LHaQHI0BYraXLyXaktYN0jW+bllyv5lEhc9Iqjvd
 UrgclACCW1tIbwga9/B4vmzATufC3gs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-EdjlhgObOPeXHxjMlOacog-1; Tue, 28 Feb 2023 05:51:48 -0500
X-MC-Unique: EdjlhgObOPeXHxjMlOacog-1
Received: by mail-wm1-f70.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so6720248wme.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677581507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
 b=mxMm4B01KFR76GEjb0Vpo/EocsrysBkRgSg1WPOmAPnPT3CKLY1023W4BzfnSR+xfL
 tjrrvvp7irikhepw3NqedcwO7LxKcee+hDZb+x83CsEzTTg8TzX9ua1GBXpFVxwol73Q
 q8yAlyRtu6lOoMVpSoOd7Ru4O2KsuQyT+n2Qpu1I8KQsviKqYkqkReklGkVWWoli4YPo
 7GSFM/L/T+kht/LDoxT6CSnhYKALAF0QNYC8mEYlee3pDilRn/LaS2XJ2VYcg+AcR7wJ
 y7NZ+l02WzR5P0/Ni/UpCjtAFjgPQ206I0T1rnIvvl+yF2dUHnTa22lbM5T0F3TB0Lo3
 FkMA==
X-Gm-Message-State: AO0yUKUuSTEr3b1BFjjii3+o+zwuU0+MP1wTuc1M/oXhTDY8l2bsQ7KX
 P+8RC77M0BuKTXx0OCcmIvmW/8LWRUHKrNLPap3+QXAE/jeXZRK/uDgqylIozVhObfJF/VCual7
 Fy+hq/0mVlbvonEI=
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id
 q27-20020a05600c331b00b003dffbd50690mr1723642wmp.17.1677581507230; 
 Tue, 28 Feb 2023 02:51:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8cQlDBvAlJdAHtDjB/GY2t5VT2TFTWjVV6lyCTysKtoQJ8w5SKvyN5sJMgC80hVK24t3HvYw==
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id
 q27-20020a05600c331b00b003dffbd50690mr1723636wmp.17.1677581506970; 
 Tue, 28 Feb 2023 02:51:46 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm15589805wmi.10.2023.02.28.02.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:51:45 -0800 (PST)
Date: Tue, 28 Feb 2023 05:51:41 -0500
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
Message-ID: <20230228055016-mutt-send-email-mst@kernel.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cz5uhy50.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> The question to answer: Is 32 bit x86 worth its upkeep?  Two
> sub-questions: 1. Is it worth the human attention?  2. Is it worth
> (scarce!) CI minutes?

3. Is it worth arguing about?

-- 
MST


