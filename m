Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B111B442E40
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:34:48 +0100 (CET)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht03-0004bu-Lp
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsNy-0003qJ-Vb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsNx-0001FF-GO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRoIm9Bu0p63jB+emQbi9gXrhkrujBIgWXsVvtv5j4c=;
 b=W2KoQXjN1fDP4sgJnbkemeGYpRJS8sYC+3uzDkv/3D+DCcdnRgr8ALTaWxCcg1kwQmeY6A
 GJoz+lRzBhdBCh8k/4+WfpJGYcpaJ299LC9/SuT+LRbMS3xpei4EEkItTrG/6jA7n14H5o
 0hLgPILL1YWDsLqeSNW1W4simopQEhA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-C_x6aSuVM66WogkVgwcVfA-1; Tue, 02 Nov 2021 07:55:19 -0400
X-MC-Unique: C_x6aSuVM66WogkVgwcVfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso7380227wri.17
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bRoIm9Bu0p63jB+emQbi9gXrhkrujBIgWXsVvtv5j4c=;
 b=uAXltQIgtVhJuDAyGv5/jZ4pZYHPPmAMguc0xQwVKDQ7m3D4SDhsM/aTo7p1M4QUN2
 vwPkTIyk8y/xgxD0wZHkv5t8w8FrFSq9aSW4KLsITFBK0tYgZWquNK3IvvJfe6w966l6
 gX0Olu3szKAQLT/a+eJpjgnRlGMtHz5rZJlH4t+yOIC9oXm8ndpjsFQT3WD36KNxRp6O
 zHO1nLxRnTstBItZpYMX522rbT6pI9apm8g+Qexo1aphYLc9ZY+AjR26JfvdYth0UAqX
 XyJdBGiA8pQ301A3bwjY1yCVkXfkKoFQlc1j0aTFEXsAmS92sIXYbGECu+gf5Zrx390P
 VorQ==
X-Gm-Message-State: AOAM533Rl60bPEXtFj9hSW9jbOv2bspDJUoVKECFZQGWgDHkxMApPIfb
 5+befPTk99LVpJqf+npQlqt7YgkSeNM989LDyJmCEBZbp337xWe7AByNbiNV4XbUMENYWAV+TFR
 bLgcA0kFg6t4655I=
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr719005wmq.34.1635854117965; 
 Tue, 02 Nov 2021 04:55:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL9E6C1Vt2X8u20gNRitl8RsJ/JAcCbKp+wSi5lAfEt/rWvJ8NNUaUjpXZO2EpsI1CIYg+6A==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr718988wmq.34.1635854117809; 
 Tue, 02 Nov 2021 04:55:17 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d8sm17244657wrv.80.2021.11.02.04.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:55:17 -0700 (PDT)
Message-ID: <8bcdff92-b49b-03bb-5b73-8a6a9086ea1e@redhat.com>
Date: Tue, 2 Nov 2021 12:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] meson.build: Allow to disable OSS again
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211102105822.773131-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211102105822.773131-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 11:58, Thomas Huth wrote:
> If sys/soundcard.h is available, it is currently not possible to
> disable OSS with the --disable-oss or --without-default-features
> configure switches. Improve the check in meson.build to fix this.
> 
> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Only ever look for OSS if we also have system emulation enabled
> 
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


