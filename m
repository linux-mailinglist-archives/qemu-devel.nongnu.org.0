Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6328D628
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 23:15:32 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSRdr-0005PA-5m
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 17:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSRca-0004wg-BO
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 17:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSRcW-00065D-6q
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 17:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602623646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQngR6pvFErM2kLxn9zymTZhzXwMUjMuBCWJ2fsnmEo=;
 b=AZ0ssphCIWEsBheOcCh3ElEPJ4afSjxekvMZLkY2alkBmn5uW6fwpDiMcKqBEr9mRAwDJ1
 wwhr7McSPvu+F6h52ouGrgAnnanNcOGmbRuo9D/101wcA+vfLNkveW/NLMO25RijBYVAW4
 pRoAT7owjEfCMW9N82Id9hHDrUeEfgQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-AeP4E8R9NrOz9slg0kDwbA-1; Tue, 13 Oct 2020 17:14:04 -0400
X-MC-Unique: AeP4E8R9NrOz9slg0kDwbA-1
Received: by mail-wr1-f69.google.com with SMTP id u15so337849wrn.4
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 14:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQngR6pvFErM2kLxn9zymTZhzXwMUjMuBCWJ2fsnmEo=;
 b=SmZR6vIwHV/xot52XhYmO1y13NndVUUzjzPi0FL90NKRYi66zOECg/9GZimPtaVjG/
 AsfRwhH4njHUe19iJnRQQkk7ma2thPpLVQwClzr+UZUDoJwhJ8M7rJZynzymXP8Ou1+d
 0gOJ2iFbrP3ufiUv8YRz4HV0sjPPT2KDlTHHNz9DusYOLKC4q5c5YDRMUUNWkAa0s0dj
 if9Yq62MLQv4yxv+ST8set7z4mCZHEJAntt5cBZGRzdBFcEEt6CWgS+Bc2Bo+iKAryoo
 kwmv2IoRAI3k2lhN3HDyN1VH/YwpJuwmBJafil2E78PPu4Up1TMDUJsdzrAtciE7llRu
 oMZw==
X-Gm-Message-State: AOAM532jet8ZiVYD0xIHfT43jmW8KzQ163a6uqCx1O5AJ4AI4rAqjL7M
 98c21edyn/N7hZybwLZnY86TJA8abQxwdsvC0iQGlNRFtfw68ftD2N0UjjL+bv3ruJLzALwitjV
 oEDL3zR/xT9oZ4qE=
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr256591wmh.26.1602623643443;
 Tue, 13 Oct 2020 14:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6XoL+Lqw/Z7pqK3pfegkhtL1n1xZJltJBp0xQfhFZh/ZKP0xw+mGiIGHhAi8VGs+ptaVo0A==
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr256569wmh.26.1602623643158;
 Tue, 13 Oct 2020 14:14:03 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id c68sm271910wmd.34.2020.10.13.14.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 14:14:02 -0700 (PDT)
Subject: Re: [PATCH 2/2] qga: add ssh-{add,remove}-authorized-keys
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201013202502.335336-1-marcandre.lureau@redhat.com>
 <20201013202502.335336-3-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af872421-2215-72e5-77a2-7d496325c413@redhat.com>
Date: Tue, 13 Oct 2020 23:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013202502.335336-3-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
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
Cc: berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,

On 10/13/20 10:25 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add new commands to add and remove SSH public keys from
> ~/.ssh/authorized_keys.
> 
> I took a different approach for testing, including the unit tests right
> with the code. I wanted to overwrite the function to get the user
> details, I couldn't easily do that over QMP. Furthermore, I prefer
> having unit tests very close to the code, and unit files that are domain
> specific (commands-posix is too crowded already). Fwiw, that

FWIW

> coding/testing style is Rust-style (where tests can or should even be
> part of the documentation!).
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=1885332
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
...

> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index cec98c7e06..50e2854b45 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1306,3 +1306,35 @@
>   ##
>   { 'command': 'guest-get-devices',
>     'returns': ['GuestDeviceInfo'] }
> +
> +##
> +# @guest-ssh-add-authorized-keys:
> +#
> +# @username: the user account to add the authorized key
> +# @keys: the public keys to add (in OpenSSH format)

You use plural but the code only seems to add (remove) one key
at a time.

'OpenSSH format' is confusing. From sshd(8):

   Each line of the file contains one key (empty lines and lines
   starting with a ‘#’ are ignored as comments).

   Public keys consist of the following space-separated fields:

     options, keytype, base64-encoded key, comment.

   The options field is optional.

   Note that lines in this file can be several hundred bytes long
   (because of the size of the public key encoding) up to a limit
   of 8 kilobytes, which permits RSA keys up to 16 kilobits.

   The options (if present) consist of comma-separated option
   specifications.  No spaces are permitted, except within double
   quotes.

@openssh_authorized_key_line is ugly, maybe use @authorized_key
to make it clearer?

> +#
> +# Append a public key to user $HOME/.ssh/authorized_keys on Unix systems (not
> +# implemented for other systems).

Here "a key" singular, good.

> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 5.2
> +##
> +{ 'command': 'guest-ssh-add-authorized-keys',

Here "keys" plural :/

> +  'data': { 'username': 'str', 'keys': ['str'] } }
> +
> +##
> +# @guest-ssh-remove-authorized-keys:
> +#
> +# @username: the user account to add the authorized key
> +# @keys: the public keys to remove (in OpenSSH format)
> +#
> +# Remove public keys from the user $HOME/.ssh/authorized_keys on Unix systems
> +# (not implemented for other systems).
> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 5.2
> +##
> +{ 'command': 'guest-ssh-remove-authorized-keys',
> +  'data': { 'username': 'str', 'keys': ['str'] } }
> 


