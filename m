Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B463C2B1A51
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:52:23 +0100 (CET)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXcs-0003pg-Om
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdXb1-0002kW-8P
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:50:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdXaz-0004fR-J9
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605268223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwufyqpyHAribIwsggrsZALzoiegWtdf4jCfSnVzWCc=;
 b=KojDzAkWo/8OajxhwWkxW/nhTIX/9bPGHJgnQ711sz2a/A07nUIJGACpHRWxVnueiyn7bb
 eMtlc6q59AbJgQw7YisDL0bylF9fZaM6cUI5iOnZpa7C2KwJApsPvnQiZH67M+9OhTYbXO
 E93mDHjzIN0Fd3gOVVQIeYh0CjrRKJg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-nEtcH-JROLa4jlqYj8aRdg-1; Fri, 13 Nov 2020 06:50:22 -0500
X-MC-Unique: nEtcH-JROLa4jlqYj8aRdg-1
Received: by mail-wr1-f72.google.com with SMTP id k1so3675674wrg.12
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 03:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwufyqpyHAribIwsggrsZALzoiegWtdf4jCfSnVzWCc=;
 b=NMSJsmvZVT77gOC4RAYUxSF+5op8T+pYHO2MAvMymbIYNGXwn2sQbET5TFOr0BvW3v
 ag1f9NcHug00Mg/4Dw1LHX6xAIr43FSw2lkMR0Zq78tmPvgjsxEDYpNWnFoq7e6GMf31
 0Wd0WBZmyqhnyAoZskkz/GLhOUmroN6D+qHvhcLleZ+1x0onn6zXlzqUbNPbX6gILNdB
 2in5NXQ4giesh54AzVg5GxDOwF484i3M2f2JBUWb+qCRbk1TYEmuLT5BdUEP66kaA+7V
 HE0l0wpUber6kC3RqVqrN5unkZoeEGz/GXhgNzZ2SSo8O6CFw2DKBkfrVaw40NZnW/0W
 BR0Q==
X-Gm-Message-State: AOAM5305aohqJ9uMkkXsf6LIvprm2+DFt63693vHtdjF3j4ahIcMXjhX
 DEEZc6Y57W4SzQYQK9d6VkSka4Axaradez2vJc07PCnqg+WSwLNyisLi5RKopMG4+f0ZFna9VCi
 9+aGMym5/67B3xrQ=
X-Received: by 2002:a5d:4588:: with SMTP id p8mr2984076wrq.224.1605268221081; 
 Fri, 13 Nov 2020 03:50:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZBs/SVVqIF+GLYIANxHSlWqs8KKXkV5HkbGXGy78aUJSwziMzyx1b9D0Waqp+H6k2n6oqTg==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr2984050wrq.224.1605268220885; 
 Fri, 13 Nov 2020 03:50:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x12sm3444562wrt.18.2020.11.13.03.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 03:50:20 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201112175905.404472-1-kwolf@redhat.com>
 <20201112175905.404472-9-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/13] char: Add mux option to ChardevOptions
Message-ID: <f2f96454-5cbf-ae74-25dc-4d509a88faf4@redhat.com>
Date: Fri, 13 Nov 2020 12:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112175905.404472-9-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 18:59, Kevin Wolf wrote:
> The final missing piece to achieve compatibility between
> qemu_chr_parse_cli_str()/qemu_chr_new_cli() and the legacy command line
> is support for the 'mux' option. Implement it.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> ---
>   qapi/char.json |  4 +++-
>   chardev/char.c | 41 +++++++++++++++++++++++++++++++++++------
>   2 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/qapi/char.json b/qapi/char.json
> index e1f9347044..d6733a5473 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -453,12 +453,14 @@
>   #
>   # @id: the chardev's ID, must be unique
>   # @backend: backend type and parameters
> +# @mux: enable multiplexing mode (default: false)
>   #
>   # Since: 6.0
>   ##
>   { 'struct': 'ChardevOptions',
>     'data': { 'id': 'str',
> -            'backend': 'ChardevBackend' },
> +            'backend': 'ChardevBackend',
> +            '*mux': 'bool' },
>     'aliases': [ { 'source': ['backend'] } ] }
>   

I think this shows that -chardev and chardev-add are both kind of 
unrepairable.  The right way to do a mux with a serial and monitor on 
top should be explicit:

             stdio
                ↑
          mux-controller
           ↑        ↑
          mux      mux
           ↑        ↑
        serial   monitor

	-object chardev-stdio,id=stdio
	-object chardev-mux-controller,id=mux,backend=stdio
	-object chardev-mux,id=serial-chardev,controller=mux
	-object chardev-mux,id=mon-chardev,controller=mux
	-serial chardev:serial-chardev
	-monitor chardev:mon-chardev

Adding automagic "mux" creation to -chardev is wrong.  I don't entirely 
object to the series since it's quite nice, but I see it as more of a 
cleanup than the final stage.  It hinges on what Markus thinks of 
aliases, I guess.

Paolo


