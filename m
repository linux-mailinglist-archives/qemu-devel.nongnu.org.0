Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5E23EBB2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 12:55:42 +0200 (CEST)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k402H-0000LB-Ch
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 06:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k400F-0006XB-TN
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 06:53:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33017
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k400E-0004Pm-AU
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 06:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596797613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDxx85iN6Z57BOXUiV9YtUpOYjo47s1PI8Oxwi+0jSk=;
 b=XiyAay9iYLDpufwlPXI74ejPk/qNmpHR47ejBhx5l8ExqVILtKND9hkZSRngN2j/yyEpPR
 8CPejkIN1RPAcPgsneh0B7Tlc3KYaCcab4IkZPAJLzRochr6b+UVXFhXpRJFrmqrASkV1q
 D9b7pihFlK6kA11WAFsBqs0sEbdeNIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-rUU9QMReNC2UAYOX4c_wbA-1; Fri, 07 Aug 2020 06:53:29 -0400
X-MC-Unique: rUU9QMReNC2UAYOX4c_wbA-1
Received: by mail-wr1-f69.google.com with SMTP id b18so599971wrn.6
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 03:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDxx85iN6Z57BOXUiV9YtUpOYjo47s1PI8Oxwi+0jSk=;
 b=MrT0d51SnxgTB7KlKbiYoITlVnd/co7bqxkFgrS5JvPi6kO5qP/33//zTjds1YDZWJ
 sdaDzsI7xdnjIWwAEjmp7Dr/9Cmt+hUXWKsW66hyfCnvewXbr28RvjrymgLigTnDx6cG
 VxRmY7iumJRLLoRqZM61bt2Fszv/BvBhj5xd2/Qfzn+6DhR5ZhBMMVpdzmn9mD75wsST
 nsKA6xBltziyb6+AlADcJZjZzX/kQ9T2+YuWTAfF/fk1kZIK1yqRizFkWpUS11rs0xLv
 TDQJTS22/dsG7CzaVBNGG/9suKuCM4wzhnCss2XJRqUKzCt+TuOzQz0eClr1OQCv681i
 Y1ww==
X-Gm-Message-State: AOAM531RRybokFBA6YA3GTZdMytzivmofezi8GDsbME36CvJ3MA04fP9
 n6m5Ret0CQ686AJ3i9ksqz1AzeP66FpKYc349d8pSIJJgL/GFMhjvPeh8RmXnMN4ZCogZNrp3b8
 c3hoTe8WSQwJx9CM=
X-Received: by 2002:a5d:6685:: with SMTP id l5mr11659820wru.264.1596797608527; 
 Fri, 07 Aug 2020 03:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbqPWRDnedJ0C5wh78cIRNt8iwarEA62+zU6R071czG31xI4jvzlOoKYkWwiDnIj/QL2Ur0A==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr11659808wru.264.1596797608345; 
 Fri, 07 Aug 2020 03:53:28 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.136.3])
 by smtp.gmail.com with ESMTPSA id a22sm9480151wmb.4.2020.08.07.03.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 03:53:27 -0700 (PDT)
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <20200807085302.7d7616df.cohuck@redhat.com>
 <CAE2XoE_eMv_=zoEe-v1HiqcKX+FNobKSKzV=9eLkJNivnuYg-A@mail.gmail.com>
 <4e8addca-7400-f1a1-ee56-991def2959ae@redhat.com>
 <CAE2XoE9HzvHOQ8odXwiOw+nsYOkwTK+jue1i-mQ6Mo29T+9Rog@mail.gmail.com>
 <c6059e0c-ed50-399f-111b-4d4b96c80e85@redhat.com> <874kpelqjy.fsf@linaro.org>
 <13b9e7e7-c86c-35fe-cdb5-002c93e73448@redhat.com> <87y2mqkavh.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <41104a23-e3a4-5fcc-4ebf-cdf7f8df96f5@redhat.com>
Date: Fri, 7 Aug 2020 12:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87y2mqkavh.fsf@linaro.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:53:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, jsnow@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 armbru@redhat.com, luoyonggang@gmail.com, stefanha@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/20 12:29, Alex Bennée wrote:
> It's probing for top-level targets. So if there is a way to query ninja
> for that it's easy enough to write a probe to collect them. The make
> -nqp stuff is a little janky but basically greps for .PHONY patterns and
> assumes a .PHONY target is a top level target. The help parsing is pure
> regexery:
> 
>   (defvar counsel-compile-phony-pattern "^\\.PHONY:[\t ]+\\(.+\\)$"
>     "Regexp for extracting phony targets from Makefiles.")
> 
>   (defvar counsel-compile-help-pattern
>     "\\(?:^\\(\\*\\)?[[:space:]]+\\([^[:space:]]+\\)[[:space:]]+-\\)"
>     "Regexp for extracting help targets from a make help call.")
> 
> I guess I'll have to see what:
> 
>   ninja -t targets all

It would have to grep for "^(.+): phony$".

Paolo


