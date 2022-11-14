Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD9628DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouikx-0005Ka-29; Mon, 14 Nov 2022 18:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifD-0002B8-Nv
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oua4J-0003Sp-Ev
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668434650;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XsqZ+gPA2RjFJiwFji6ZjKqI/uwLrZWsle+Ab1tJHOo=;
 b=SY2WYR5JWkLzppXb5B8IABDodRq8mvlBiWO3ZqSDlANWog2qdKoNQbljvmlFmywUmEHR87
 2qmi8Xjg5TDWGWK4aMaMoGCfqVt3AX0zPShbYxzmGHalq5FevU7nP1pbPd8XFc6qYImFTi
 55MC1V62gbwWq4PyCcKlM9XGvbjyBzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-Yn-hOBrEOdaumwLWkJe9Hw-1; Mon, 14 Nov 2022 09:04:09 -0500
X-MC-Unique: Yn-hOBrEOdaumwLWkJe9Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r66-20020a1c4445000000b003cfe4cc64eeso304038wma.6
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsqZ+gPA2RjFJiwFji6ZjKqI/uwLrZWsle+Ab1tJHOo=;
 b=iDjmu5iczuyeUrX95DQpQUCXYIvPgRMfi3npW8yJZtvft2gD5VMv33Vs5ptp/CcDn1
 Cspid8hiX+SK1B6vRKhHH1el6vGE9x2NbIqukO83ZaGwsFAMvPVof1gQkvZcNOt7LsTH
 OXuZxDB5ODPfFErfcf+Owi42odukupqwwlkGAN0EQbPBiYjbTYKX0XLS/I//HC1Pdzj4
 plMyZ9cRRGR6lIgChBmIytvL3gMDwyKbM+GolRZj+40aEWo1hCcIVxT57nMpUcMLSJX7
 sznCqvTkNSrOttyqvK8efguPPJNu3vpkwGocN0QcGidvwk0PclgIHu+2qFeuLoINu4el
 sUHQ==
X-Gm-Message-State: ANoB5plI+jp98hzVOje4uouwAWMGTh+GlPwU89yCzFnDrXngYwkpG6D0
 K1tZ0stigE7XHhAJaaY4EcFhi+3ii/yX6+4wy0hzE92ktJ88fckQg/NXqdnaWJVKCwti7blX7R0
 3VcXVYM4bmnUX2Q0=
X-Received: by 2002:a5d:4984:0:b0:22e:afed:30d8 with SMTP id
 r4-20020a5d4984000000b0022eafed30d8mr7704694wrq.207.1668434647793; 
 Mon, 14 Nov 2022 06:04:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6X1k7+JJHL6aM7R9T92bYIuNR2bvURUSMVdSUmnv//S4YFE/DFfzDUdjIZgvIuzYBgyLuAjg==
X-Received: by 2002:a5d:4984:0:b0:22e:afed:30d8 with SMTP id
 r4-20020a5d4984000000b0022eafed30d8mr7704679wrq.207.1668434647602; 
 Mon, 14 Nov 2022 06:04:07 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6191000000b0023657e1b980sm9705428wru.53.2022.11.14.06.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 06:04:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 4/5] migration: Use non-atomic ops for clear log bitmap
In-Reply-To: <20221004182430.97638-5-peterx@redhat.com> (Peter Xu's message of
 "Tue, 4 Oct 2022 14:24:29 -0400")
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 15:04:05 +0100
Message-ID: <87mt8tbpka.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Since we already have bitmap_mutex to protect either the dirty bitmap or
> the clear log bitmap, we don't need atomic operations to set/clear/test on
> the clear log bitmap.  Switching all ops from atomic to non-atomic
> versions, meanwhile touch up the comments to show which lock is in charge.
>
> Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
> same as the atomic version but simplified a few places, e.g. dropped the
> "old_bits" variable, and also the explicit memory barriers.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


