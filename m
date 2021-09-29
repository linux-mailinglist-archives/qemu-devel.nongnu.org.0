Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D805741CC91
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:24:40 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfC3-0001oC-FZ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVfAZ-0000vP-I8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVfAV-0004R1-Ot
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632943382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tw07qmXCYNTdThOb8VDOGEd7saJfGvHU6hY2r6bvPbE=;
 b=PI8LXaSgLjfRxGAd6bXqRZu9CP/+5RqiXxdTKZuBGxL/tivJvYwyFktYZZbosU5T09vKRV
 RiusidnY7xckoF2o1RBy1nQbnBwzfr5o2VT9Q79K4hzNz2jM6hEQ2j2bZ0Om6NMgaNBthE
 KaccP1gY/dPy4Df9iU0eiq8UdOccf0k=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-McRQfgMiN6KsF5QxL1hBZA-1; Wed, 29 Sep 2021 15:23:01 -0400
X-MC-Unique: McRQfgMiN6KsF5QxL1hBZA-1
Received: by mail-io1-f72.google.com with SMTP id
 k16-20020a5d8750000000b005db426b2619so3862386iol.21
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tw07qmXCYNTdThOb8VDOGEd7saJfGvHU6hY2r6bvPbE=;
 b=K7eBMfCURgePfOA8k/kHxiWkq6dN06GZ3FTyKG26PRQogc9zfX9bXNQrT9uD7wII1D
 7+vga0N3UGU3kSjw1A8Y/B71r5MqvdomwASQ5VPXRKUq/ApV8wOC/K1awrKj0ropFeko
 CO0z7H6frp0mOD28ksm2PhWVq4ZynNZMrD0kcBlEIAKaMMfSgLvilT0Um3g7CsZGa3aA
 nIFWmRZ1q+ExP5Rwyl/4NGR9BTQWvoOzTQ1qeELj5TdMyqKT1tyEZduU+/XFhTNqoQpz
 h9919ehycAhcINerJ+W7YKIVLkISNg3rxCd7ycWyPX2wKOg6vCOsFTouMUOQrHhWGD3E
 MT9A==
X-Gm-Message-State: AOAM530fVz94LVywquC6Utm3gTYfPvu6DskXMyAxkBLt9it1/8eQ8Flj
 Jss/FNPdGhjJssjZQ/yMXwNXimJavGDjZwgTGPROVst6MPReD6iqbDUIolULxc8kQasep4DW3bz
 2OAYY5Iz8biLIBCo=
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr1047514ili.142.1632943380596; 
 Wed, 29 Sep 2021 12:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoqedMylj3/xhVlX+WiD1giT1T2W/usrmCPPSL3Lp+u19pMTTQyb/8wzjjAh3rvgdu6TUHJA==
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr1047496ili.142.1632943380340; 
 Wed, 29 Sep 2021 12:23:00 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id r3sm465488ilc.56.2021.09.29.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:22:59 -0700 (PDT)
Date: Wed, 29 Sep 2021 15:22:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v3 0/3] QIOChannel async_write & async_flush +
 MSG_ZEROCOPY + multifd
Message-ID: <YVS9Ea8BbnrMikRu@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
 <YVOcT0qv0Sv72BmS@t490s>
 <CAJ6HWG7kL1jHmZQX1yLciqEksr=bmvx3f4VHRGqQLf_tT2CKnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7kL1jHmZQX1yLciqEksr=bmvx3f4VHRGqQLf_tT2CKnA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 03:34:01PM -0300, Leonardo Bras Soares Passos wrote:
> You mean like I did in pre-V1, enabling ZEROCOPY for multifd it in QMP?
> Or is this something else?

I mean any way to still be able to turn zerocopy off? E.g. when the user has no
privilege on mlock.  Thanks,

-- 
Peter Xu


