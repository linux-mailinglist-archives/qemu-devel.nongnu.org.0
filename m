Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E244149D461
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:18:38 +0100 (CET)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpgc-0002lY-1s
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpe5-0000B3-WA
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpdv-0006Up-Ls
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643231751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OJIksz5F5eBFBJyFej53Va9bG/XrJLIdaz0u7gfpqv8=;
 b=Ko2jKOy8/Vg8cr88PcyBxIXfhHeBBsmCpIJlkeoEl27Ib4/Ucn3lLh5VphgiSwCOHZb98J
 tkr3wF640fVeZrUgeNQzutTKsH+x8zKBS5uvFoebFg8jSwMQWpA6hRCr58E6dFi0Js6Wrz
 +dyI1i+/iIFDjJij1S7klyfMTwqUxQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-IvwyYpuYND6kZX8FIVlhVA-1; Wed, 26 Jan 2022 16:15:49 -0500
X-MC-Unique: IvwyYpuYND6kZX8FIVlhVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d140-20020a1c1d92000000b0034edefd55caso3120116wmd.4
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=OJIksz5F5eBFBJyFej53Va9bG/XrJLIdaz0u7gfpqv8=;
 b=p/lBtD+5vOMkWg8Aqx/TdD3g0Ucga36ItyPdNQ6Nn14avzkyRTQ7kAjvnfyBdlRVPB
 HRq25vy1FJOp9h0XA7r8B1augGry79xvcGFAC0DQCrzfs8QgD9/VXlAxF0c8L1Dyfdnm
 1fu3cDRbuuHrdVaiUlt3nvH3piJet2ETPQlcPuGpOgl+I2ZUVI5z0+6WC17qjVmtzwWv
 E4JvHgbzTu5iuNjJgxVCry2bjVRcIKuxa/c2pXkWYg7xIPYflBBka37ZP9Y+N0t3FuAr
 yqXGMY/ppojb28ZWTDjbiP+Wx8SvoP1rNaO//q/hSOQl/U/QSt57FgOoX7vXB0N2pkrN
 vjFQ==
X-Gm-Message-State: AOAM530SzNqLzdWWTkjt5wcdYBYy8plwH7tg+Pe6smCVPS3Cly5OYwte
 dQ6I+p+DBlYLVtZhhu0Pjk7RkZd4gXDjpb+RRHpGtyfKILYxOtySLLNC5HfI93JxpwKmFXYCGiJ
 sVuoSoiOc2E/sRj4=
X-Received: by 2002:adf:ee4b:: with SMTP id w11mr396246wro.248.1643231748574; 
 Wed, 26 Jan 2022 13:15:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQPWp4aW22rWJ9D8ubQeaeYoOtaqNbXm8P8XOx3cCU32re/gJ3Js0Qn+Cxo3k84FlPQJZcAA==
X-Received: by 2002:adf:ee4b:: with SMTP id w11mr396234wro.248.1643231748433; 
 Wed, 26 Jan 2022 13:15:48 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id c23sm279628wme.35.2022.01.26.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:15:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/7] migration: Do chunk page in
 postcopy_each_ram_send_discard()
In-Reply-To: <20211207115016.73195-5-peterx@redhat.com> (Peter Xu's message of
 "Tue, 7 Dec 2021 19:50:13 +0800")
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:15:46 +0100
Message-ID: <87tudqmc59.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
> huge page information; the 2nd time we send the discard ranges.  That's not
> necessary - we can do them in a single loop.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


