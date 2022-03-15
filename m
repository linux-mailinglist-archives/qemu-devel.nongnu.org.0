Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C04D9C49
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:31:40 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7H0-0005jO-S7
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:31:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU7Aq-0006n4-VT
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU7An-00056G-J0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647350712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMi3WewLyhi7ncul0JwLeOubIDdPL0359zjYep6iYYM=;
 b=U5FE3sxtQ2fydfGkQpmjMkz/g8Lv2aPbM1p+7h+ZQ4fjN8uKzlBjsjGVttf1lQainzx1b3
 oBXO9Q9J/lUE+FbmNnDxCfDH7eY1oZtR7OGVi920D3g+nbI6cQ4bsqCGx3mPUfcBecsgt1
 6GtMMf71h+/a+5wLql7XYePxJBClG6A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-YVoV3XZeN7ehYKOAg5CP5Q-1; Tue, 15 Mar 2022 09:25:08 -0400
X-MC-Unique: YVoV3XZeN7ehYKOAg5CP5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 l10-20020a05600c27ca00b0038b85cf8a20so934532wmb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 06:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UMi3WewLyhi7ncul0JwLeOubIDdPL0359zjYep6iYYM=;
 b=PYANPEX82YSDSh5xflOkPHTjNQOWrMXtFx7b1WF9K+RMlDN6dwXYQDkEP5+AP1h5m8
 r3AfYfPhZ2P437IhwYowNJrHa+tmVvgFDKbdJM5Yts+bU3i/mYqsSzTk2hJLcmehqxId
 AQNhr7HlHhok/GzHYbAR4FwA9ltUEupUYT8wUCK21rlLw63lfWnK/9cdYCuG2du4qi+2
 S9C1JPIgjo/4/h+fJpb+c2rEgpTHohb6pEW72EfPI6L5hcZKHunpyUrG2lkf9KfkVlO2
 M2+yLZ7TP1Qda451mI9ZuYBo7QIQtiP6NuAsuSjVJqGxF07hMT+xdSekDO8JMfoaCwY4
 g8JA==
X-Gm-Message-State: AOAM530zY+Cv8w+gw176MzhkXMom6VXvI2ln3QphneFZBUNgCmsg/ePv
 jctqw3foFWTqZ9eqrQ6FNl6Vl3VzC+QxbK+YKKowozWjQRQ8CBfPcgQH5a//XtuYhO9hNwrFeHT
 uD5M3Wea/oQXh/9Q=
X-Received: by 2002:a5d:5308:0:b0:1f0:6300:f1d0 with SMTP id
 e8-20020a5d5308000000b001f06300f1d0mr20827544wrv.278.1647350707844; 
 Tue, 15 Mar 2022 06:25:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjsKXJfGP7E5SWU/mtU6yQ+6XkuE0ctOoo3gLvyG+RHJvBdwmBn47ncliEWsmUx7yA4WhzEA==
X-Received: by 2002:a5d:5308:0:b0:1f0:6300:f1d0 with SMTP id
 e8-20020a5d5308000000b001f06300f1d0mr20827520wrv.278.1647350707604; 
 Tue, 15 Mar 2022 06:25:07 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm16802069wri.110.2022.03.15.06.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 06:25:06 -0700 (PDT)
Message-ID: <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com>
Date: Tue, 15 Mar 2022 14:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220314104943.513593-3-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/03/2022 11.49, Kashyap Chamarthy wrote:
> This document is referred to from the GettingStartedDevelopers wiki
> which will be rSTified in a follow-up commit.
> 
> Converted from Mediawiki to rST using:
> 
>      $> pandoc -f Mediawiki -t rst MailingLists.wiki
>          -o mailing-lists.rst
> 
> It's a 1-1 conversion (I double-checked to the best I could).  I've also
> checked that the hyperlinks work correctly post-conversion.
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/devel/index.rst         |  1 +
>   docs/devel/mailing-lists.rst | 53 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>   create mode 100644 docs/devel/mailing-lists.rst
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 424eff9294..fb9d9f3a80 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -12,6 +12,7 @@ modifying QEMU's source code.
>   
>      code-of-conduct
>      conflict-resolution
> +   mailing-lists
>      build-system
>      style
>      kconfig
> diff --git a/docs/devel/mailing-lists.rst b/docs/devel/mailing-lists.rst
> new file mode 100644
> index 0000000000..53dcbfb007
> --- /dev/null
> +++ b/docs/devel/mailing-lists.rst

At least the "users" mailing list is not related to development, so maybe 
this should rather go into docs/about/ instead?

Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


