Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2F54C7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:48:00 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1RV9-000651-61
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1RQN-0003Yz-SH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:43:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1RQL-0004X0-NH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:43:02 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h19so11761777wrc.12
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pT6n1IHrkVentSe6SZnB94cCuU5R0Ssmzjr7C7LIhyY=;
 b=Bj4vaLcM2qyVA47aZi7jUDxLc5EPDLXzxVAM3up+LaQFjNje3KmI4KhHeuXs9cSUB7
 EhO9iVv4f9OBd6WI5WMVxsAee+FJx6A0Pe8fGg/QqmWF+vAAa8jyDAu8TvKliJ2TPcEw
 vEogaXE0K9DsbaActL65WTbB3f/QfP3sq0OU2guJRQ6D13B/G+OLeJBXGzuSrBDTQAjv
 74HqtmwLDMDJaw+hX2LZLM6wc22Yi6Vbt32HstTIbkogCW5dPNhHXL3Qch3Azod2oeqs
 1p4QWDpzQ1i3jZ7cag9HLI/5xowsLL4mmcXiqe9hSRUcL4qU4Y7Twdtthz5IqdY8rb8Q
 j2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pT6n1IHrkVentSe6SZnB94cCuU5R0Ssmzjr7C7LIhyY=;
 b=rFxrmNzxnl76YleJa0zIK89x7bquEc+4yEKFVbWI7TczwKUvwsCg128TTWlH4QRG9x
 7PJtlzZV+ck7e5YN+20Pvp4wAmxeeETQR06oNzKKcPNTP1jVwi0dBTW/woZgVZhPozd2
 +ADoUNfFFz8tIgt20woSh5vWMsBPXi3IKiA9XV9K5ZxHwZj7ub9UOBIwGk5Z4oi897z3
 sBlx2K4wUGcJ80JOUeMrwh05wNTcE8ZcKzFvVrK+ARPpyTUWymhiTlRq08D0Glc/R8Ur
 fYXvRegIire9xTV/cYLpHJJhs26JWqvjrxtwJC1XEk52eNJQdSHan8dCnXqaTPDv2d7e
 HJ+w==
X-Gm-Message-State: AJIora+pQWPP1oelj+d7zBPqk0RCxsRczxB4xJjgZ49/81OfFZwh5Zlx
 VKCjmPY4fwM+yxI1FsNdEls=
X-Google-Smtp-Source: AGRyM1syAaRyxv/qBzbjsWozUrXGRDCx/U7VPgBWnrretMz12NAo7L01gV90v8HyglqpmN6W5uhymg==
X-Received: by 2002:a5d:59c1:0:b0:218:548f:864 with SMTP id
 v1-20020a5d59c1000000b00218548f0864mr9344185wry.361.1655293380097; 
 Wed, 15 Jun 2022 04:43:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k7-20020a7bc407000000b0039c693a54ecsm2882065wmi.23.2022.06.15.04.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 04:42:59 -0700 (PDT)
Message-ID: <c614ed56-0c6e-e964-44a5-2b614ec3cd34@redhat.com>
Date: Wed, 15 Jun 2022 13:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/4] net: convert to use qemu_find_file to locate
 bridge helper
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
 <20220615105212.780256-5-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615105212.780256-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/15/22 12:52, Daniel P. Berrangé wrote:
>   
> +    case QEMU_FILE_TYPE_HELPER:
> +        rel_install_dir = "";
> +        rel_build_dir = "";
> +        default_install_dir = default_helper_dir;
> +        break;
> +

You're replacing ad hoc rules in Akihiko's meson.build with an ad hoc 
enum + the corresponding "case"s here in qemu_find_file().  There is 
duplication anyway, in this case between Meson and QEMU (plus QEMU needs 
to know about two filesystem layouts).

Paolo

