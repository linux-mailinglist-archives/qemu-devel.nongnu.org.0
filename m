Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581272EBDBB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:30:55 +0100 (CET)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7xl-00052K-0f
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kx7wA-0004UZ-UU
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kx7w8-0004Pf-A3
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609936150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZcKvMUCV/6neA6Gs+mm5ZOitZQ0/f4FzD6wSx63b/w=;
 b=XQ5g86rU8BdNLCk/knyZz2CDw9iRBT4GUuBZ51VQ5fWtEvHvXDj5fsmczuRQryPpXP88sD
 VlpULfvbRRCVJ6fu31sl0ofFZTGII6zPlZAxr38mLLqNXMwlnXakL8+rE1r/buMW5Qxk/y
 Q/fMAB014d/9HWmOXOfRss4qgfuX5AE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-Pf82bGs2Md6ky0DuzpnB7g-1; Wed, 06 Jan 2021 07:29:08 -0500
X-MC-Unique: Pf82bGs2Md6ky0DuzpnB7g-1
Received: by mail-wr1-f69.google.com with SMTP id r11so1282773wrs.23
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 04:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZcKvMUCV/6neA6Gs+mm5ZOitZQ0/f4FzD6wSx63b/w=;
 b=Ryt/Z5RiYIBtdb7eLCjI+8RIsMP/aiSGgq1LX9qJ+wGKrafDMGonJxAhaWwMruyjO/
 oIm4n/R7YuixkGmm4t6EDnr7QTDOD4NCsJCvbudlypiSr8DHSvulYr1fCGyYR278e0S8
 bU89ZLuHtxmxJ0F2PDphMh305SvVzHYswxHP5zmmRNXD2nf2NayNsriaudSVYbl7Mk2t
 YMuDo30r1+4MiAclhZnmDn1RWlFbi/iBqC8zCtokWGKNMh6cPhygnjjks/XG5kFhGeHG
 yeNBz+auXNBubb7oJ+gEJKYK1D3mO9eNvM/Lmj4WHT81rOQBx3gvoPBMlwIkLI0nX7se
 tYbQ==
X-Gm-Message-State: AOAM533UqBSoNipcCPl36fmAJyT4n9SZdBkNbCbbBCH61+5qo8e00a8n
 Uz2IapBeAnJCnqAd/ClXAtyBRa/ifR1ec291CH/rbU4mTPKwJrPJVK6D+tpcSVW2pdaUNIQ2ZDd
 C4+OBP/TPBakMY1k=
X-Received: by 2002:a1c:2d92:: with SMTP id t140mr3578095wmt.114.1609936147175; 
 Wed, 06 Jan 2021 04:29:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYP6Qn8OIk7+8O7HzVqWA9RMjwQq7hwIBWfpcPbQm/f8DOPgX+bgRXg2VZCCrA2CqqFNiAWQ==
X-Received: by 2002:a1c:2d92:: with SMTP id t140mr3578077wmt.114.1609936146922; 
 Wed, 06 Jan 2021 04:29:06 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id 94sm3065977wrq.22.2021.01.06.04.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 04:29:06 -0800 (PST)
Subject: Re: [PATCH] tracetool: strip %l and %ll from systemtap format strings
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106121932.1002928-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <833a579f-d4b6-ea9d-b4e5-5c8400bf935c@redhat.com>
Date: Wed, 6 Jan 2021 13:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106121932.1002928-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, William Cohen <wcohen@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 1:19 PM, Daniel P. Berrangé wrote:
> All variables are 64-bit and so %l / %ll are not required, and the
> latter is actually invalid:
> 
>   $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
>   parse error: invalid or missing conversion specifier
>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
> refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
> 
>                        ^
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> This is an alternative approach to
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00550.html

Indeed more future-proof.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
> index b486beb672..7bac10784b 100644
> --- a/scripts/tracetool/format/log_stap.py
> +++ b/scripts/tracetool/format/log_stap.py
> @@ -49,6 +49,12 @@ def c_fmt_to_stap(fmt):
>          elif fmt[i] == '"' and not escape:
>              if state == STATE_LITERAL:
>                  state = STATE_SKIP
> +                # All variables in systemtap are 64-bit in size
> +                # The "%l" integer size qualifiers is thus redundant
> +                # and "%ll" is not valid at all. Simply strip all
> +                # size qualifiers for sanity
> +                literal = literal.replace("%ll", "%")
> +                literal = literal.replace("%l", "%")
>                  bits.append(literal)
>                  literal = ""
>              else:
> 


