Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B888577F29
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:00:22 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNY5-0000jZ-BB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNVu-00063P-Fn
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNVs-0004O8-2l
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658138283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLiGYDC9ccTQoG794QMWxNl2QkcK0p/u6BWX4w8bIj0=;
 b=Ey17li3yvHw2sjCkHOm+YMvNTb/yWZGANyezG3hOkhtpNYAReDemIAlGwNxDhnTiSDmsWh
 wniqbKMtpkUapNx+a3z+KJoyzUW4Y3ePY34epcMldSXH0XOMuMc9GFNUjYCWG07KP18Aib
 +fZhGw1hgUVC/tokbHFRjfS7mFUufOE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-mBYTL8WVP7OKMyOmK2ps2g-1; Mon, 18 Jul 2022 05:58:00 -0400
X-MC-Unique: mBYTL8WVP7OKMyOmK2ps2g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v18-20020a05600c215200b003a2fea66b7cso4043700wml.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLiGYDC9ccTQoG794QMWxNl2QkcK0p/u6BWX4w8bIj0=;
 b=Noo1dd+UFkIkYrHaRRA+UT9IvNDqEKtm/qqKZH92mVR2sTG2naf+UviWYxxUdhQmew
 dwuC6VvYLGxNqQQ5Xuy+NeS6VJa+8rGqmiyKjXGJcEGQ4vsIeCfGGTXiIeT8DFUxrPZM
 ZUBvILm1XQL6yC3ZZCyzLIoY9eXNKuiCX2z/bbymcd/Lf8EZEelzjOyVyoX9yTj0rRva
 9E7D4cyjxiGjFU+kUFswrTTs203qBYpeY2pCfa424X7dH7F+NRvwOwzCRpLVPXwAQN6j
 ttV6fxXKXMIEiG75YTkLZ4EucexYte6wDZzMoFxYuGK4nZV/MchdRo7RA+8Maisse5Wr
 KdPA==
X-Gm-Message-State: AJIora8frwsQGovdRmRQA/nzMedWx191weIh8IwWsLWkFBnvvlTIkiQ0
 F2gtPuoXF1xkLAEJS+GtRkUJOhqvgqjt5HgZckLRy5l4Clao/Ibd7gWzmVrgfe55Z4Z1NxfGdtw
 2fZmlCjBy5Wrqrxo=
X-Received: by 2002:adf:e544:0:b0:21d:6eed:bd0c with SMTP id
 z4-20020adfe544000000b0021d6eedbd0cmr21493225wrm.223.1658138278932; 
 Mon, 18 Jul 2022 02:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vX11eNvZfSz+nUXqOHDOlxAxYI3MHFehatIQSzd5HceJM+Q6u95HlTtl1tafd45lo/d6HIDQ==
X-Received: by 2002:adf:e544:0:b0:21d:6eed:bd0c with SMTP id
 z4-20020adfe544000000b0021d6eedbd0cmr21493198wrm.223.1658138278621; 
 Mon, 18 Jul 2022 02:57:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056000180900b0021d6a520ce9sm10377559wrh.47.2022.07.18.02.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:57:58 -0700 (PDT)
Message-ID: <0e109dc5-3322-75c6-1ea0-602e7b244b40@redhat.com>
Date: Mon, 18 Jul 2022 11:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_xq_Quei=c3=9fner?= <xq@random-projects.net>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, hreitz@redhat.com
References: <20220712133753.18937-1-xq@random-projects.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220712133753.18937-1-xq@random-projects.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/07/2022 15.37, Felix xq Queißner wrote:
> The patch adds "show_tabs" command line option for GTK ui similar to
> "grab_on_hover". This option allows tabbed view mode to not have to be
> enabled by hand at each start of the VM.

Nit: In case you have to respin again, please replace "show_tabs" with 
"show-tabs" and "grab_on_hover" with "grab-on-hover". Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


