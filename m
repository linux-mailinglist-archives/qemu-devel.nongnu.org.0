Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F333C6BA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:22:57 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsno-0008SH-Ua
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLskv-0007Ll-Aq
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLsks-0007hj-Md
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615835992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYiVFztiU+zO8Nt7cAsxyy0ZaoLMLR5oE1x3E/b5GNM=;
 b=eZQaB6HeQKUYbJyfcz25GZ6aFZ0QWHZrBsYgXKurCdtLp05C6qFEsVQXoQA4PbG2qS/Bze
 B7irQzDZFRCY9buzGMTsMYzdFIgFYuCndcWpN3ju+Z20iioGnQBftld8ldo9tIvN7t7Cad
 DHoIX3ZBiRV25JVqOFBXgzUtgVstTAc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-xKxfz-XNOOisYtlCfRYaqA-1; Mon, 15 Mar 2021 15:19:49 -0400
X-MC-Unique: xKxfz-XNOOisYtlCfRYaqA-1
Received: by mail-wr1-f72.google.com with SMTP id y5so15509610wrp.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYiVFztiU+zO8Nt7cAsxyy0ZaoLMLR5oE1x3E/b5GNM=;
 b=c56ldDDNiaim5emG78USkl6WlMIMxR93PsfgCAjW7LFOenyc850sjrio2d0QyT/JZU
 2m3eaK+Sag2fA/GP7bQyXtvXm/pkQw1Wwf/fHnAYkXbUvB+l7UBT2mo9AmD79Rc0jaP1
 k3lgyoHi4kewUv9ytLkEw6Gal2RXg3vQwjDO1Ysr91NRh7AdqKrxF960TUFbUxGFZPcz
 wBdwFjrbcVoxra9MHsn3Bd5qkU5yHs08Cg4EHJYy0mEO3YMeGw2L9NBSt+cQSoYl7UoJ
 oROrMq5MVGrNjSs3nSeggJYRTIT25FAjX5HAuN41T0rf042yUk2HmfN5ApikM1kZ8Xg7
 SE4w==
X-Gm-Message-State: AOAM530/vct3VIYZZoISpEd13wDWnaT96nTUKrAsnhPBW9bBiBTwzczP
 2e9KBnnbMqEvmsPPeh3ha3lX4QeYyNQZYV37HdcPJQdq3iwx59b5GxZODLLpJawIt18nDhGff1u
 /Nk5kEHVN6fzwNgHufYyJYeBB6Uikrg9oe0kJUxK3GNvFm0BwaqY1uiDYW9uJYMoP
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr1192662wrt.18.1615835987703;
 Mon, 15 Mar 2021 12:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIQUCUlwUn85wBU420MqW0QVApCrBrEO2+ZvkXTlRuzFvsdkZ1mRrPrn79l+aRYVVkxDfm5Q==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr1192647wrt.18.1615835987518;
 Mon, 15 Mar 2021 12:19:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w6sm20598842wrl.49.2021.03.15.12.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:19:46 -0700 (PDT)
Subject: Re: [PULL 3/5] meson: bump submodule to 0.57.1
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210315173912.197857-1-pbonzini@redhat.com>
 <20210315173912.197857-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57605157-a715-68cf-8343-e6f816d4a2e1@redhat.com>
Date: Mon, 15 Mar 2021 20:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315173912.197857-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 6:39 PM, Paolo Bonzini wrote:
> The main advantage of 0.57 is that it fixes
> https://github.com/mesonbuild/meson/pull/7900, thus avoiding unnecessary
> rebuilds after running meson.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


