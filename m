Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645763F50E5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:57:53 +0200 (CEST)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIF8q-0006wc-Gn
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIExX-0006Q6-EG
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIExV-0006av-L5
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgcXDKAurQT+ptoDJgF7FWjF/VQsVkSiv3b5oL8pe98=;
 b=HAVKbh0ah4fdzC87d9oj8cSpmG53wptMiIzZrXkOupN+gaxy4lQhbztwtwYuAqJa0HlK7K
 TguvU22FF+KWY8gSu8r6HrEPEe0u5MhmXNru0FtVQXZOMRthNWsilOcFz3C9fCD2pTA3wk
 kmV/CDJiytVsr8yCP0hOyzAYhSq8WdA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-QygEOX_VP9GOyfWMOKK-eQ-1; Mon, 23 Aug 2021 14:46:07 -0400
X-MC-Unique: QygEOX_VP9GOyfWMOKK-eQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 q13-20020a05620a038d00b003d38f784161so12504260qkm.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dgcXDKAurQT+ptoDJgF7FWjF/VQsVkSiv3b5oL8pe98=;
 b=T89GoIOGOUjn1XN9L5r1e7EV/DC/2vk8dCFxf6a8C2Rd2oWhi2BR1zlz5Zbeoapgx+
 2qCxj6Q5XqwCZHgDltBzVpDbOUv1Brkc7rgbovqKwBqVrm90+KIc4I5mfTFDBil024Bd
 NF0cynFT3QmfLgBfZs2bF/4wcFfy+NsiEuvoNqP0iSSpR6182yLW0TFMnFDZ+BCRckHv
 tzf+HaLjiXbbPqekyazHdRr1otpP1Xzuv6W4UVXY6zrsy0Ln3BcrDn0zRFYXeAiXXi8Q
 eelfeujZw0a29cffVVtkI7Pd5zYM4RSLh/bMXbiq3qDVaWgkOrBSVVd1/WoRio3SE92c
 64mQ==
X-Gm-Message-State: AOAM5337+dKNnVeh+uU3y5QYXTlZ+luVPZ1r+0C0xHURdHjz3zto2Pek
 4g445Oq/wF6BW5TFRq2IyOf4NxOAaWuEis9B4Qt1ix3urcstFV5FNdpOqz1BK4dsEFE6pcqxqVP
 f3a14LlnqtmIgNaQ=
X-Received: by 2002:a37:2dc7:: with SMTP id t190mr14654479qkh.60.1629744367014; 
 Mon, 23 Aug 2021 11:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbQJgURAHotYAeQM7S7oyJ1feNnOS+J5ZKSaeqHT9ckiabr0zM5sy5gO1BKoaZTFk1ohj0nw==
X-Received: by 2002:a37:2dc7:: with SMTP id t190mr14654464qkh.60.1629744366834; 
 Mon, 23 Aug 2021 11:46:06 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id h6sm6680680qtb.44.2021.08.23.11.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:46:06 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:46:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK
 instead of MEMTX_ERROR
Message-ID: <YSPs7HFSBH1rmTRa@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 06:41:54PM +0200, Philippe Mathieu-Daudé wrote:
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


