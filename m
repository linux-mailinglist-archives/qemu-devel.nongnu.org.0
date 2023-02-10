Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2200691952
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQO4B-000223-IW; Fri, 10 Feb 2023 02:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO43-00021J-K4
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO42-0003hw-5I
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676015001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7HohraEnnLuS7SCGV4RgDXKY3P8/2UTebn28HhlcUQ=;
 b=fVQ3E2RClk4kF0LjI/pQZSmzDGwfpB3VPgrdQZaA0pINdqYH3GLVAH7IcMsCsCg45iVShS
 cgnlFtzIIcrDuNgvLCiMTN58ZmUDq8KR3AZaQFH4V1N6kOUVS9YaiPZetnU9xT8Ak8tyn1
 wHNUkVCKNAnmLAcITxCryXrhHR+5zhc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-RyWYpgf9Otu26z95sYjMbw-1; Fri, 10 Feb 2023 02:43:19 -0500
X-MC-Unique: RyWYpgf9Otu26z95sYjMbw-1
Received: by mail-qk1-f198.google.com with SMTP id
 g22-20020a05620a13d600b00726e7ad3f44so2798475qkl.8
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 23:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7HohraEnnLuS7SCGV4RgDXKY3P8/2UTebn28HhlcUQ=;
 b=IHXGgSZpPYuaYzrw6zs6Zb92W0rqw4btoaJR8wJziKEthW3KKAkiuuIfPyX/JdLuJB
 sLqz3jwV9YjILqdvZuwP8uuqWs8exZPYKFULLZnbh5zPMnsiPmqatw1VrxnSX+PCqOG9
 LvxsXhrjl5MkWQQbEOSN6dLc0RVCI2fF1EgMX+kY6pFjCjhckICxbM0LdkBE64zMVF9q
 xghGWnhVw0b8TIQ5kl7Rb6L8Z9II/Z/gysTyT7hyYCzerJnB62nrg7rSZ9dEU+Wx1lV4
 OHlXWBfuPR+UGYjvx0cBPiD/NekFrpyimLLz+2RPcRKVCxSG8VnaF0NJIpuT4TvQK6xq
 5uoQ==
X-Gm-Message-State: AO0yUKV3k/Y5Y6+NaanVfYIS7xRst/nbZO0fWZgd064TKO4pF+aBO0Rv
 u4pOrjI9p8ckSeqy0cnOHj0WQAfIY1C9sD+KvMIbbvDdq70TtGJE0jRIb5F12QHh1Bx7OlEQir3
 mY34z2gLTefxI7Fg=
X-Received: by 2002:ac8:4e8d:0:b0:3b8:6c97:e5de with SMTP id
 13-20020ac84e8d000000b003b86c97e5demr24592131qtp.41.1676014999372; 
 Thu, 09 Feb 2023 23:43:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+caySjIQAZ74Bz7BqJMfnNlYYmnsvPLuaw6J545d9z9xW+fbcW/Ef6xisosG/7GJyZGl40yA==
X-Received: by 2002:ac8:4e8d:0:b0:3b8:6c97:e5de with SMTP id
 13-20020ac84e8d000000b003b86c97e5demr24592123qtp.41.1676014999157; 
 Thu, 09 Feb 2023 23:43:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-85.web.vodafone.de.
 [109.43.178.85]) by smtp.gmail.com with ESMTPSA id
 c18-20020a05622a025200b003b85ed59fa2sm2919674qtx.50.2023.02.09.23.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 23:43:18 -0800 (PST)
Message-ID: <31bc059c-dc8c-36ee-8288-209811d9ba98@redhat.com>
Date: Fri, 10 Feb 2023 08:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 12/17] AVX512 support for xbzrle_encode_buffer
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 ling xu <ling1.xu@intel.com>
Cc: kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
References: <20230209233426.37811-1-quintela@redhat.com>
 <20230209233426.37811-13-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230209233426.37811-13-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/02/2023 00.34, Juan Quintela wrote:
> From: ling xu <ling1.xu@intel.com>
> 
> This commit is the same with [PATCH v6 1/2], and provides avx512 support for xbzrle_encode_buffer
> function to accelerate xbzrle encoding speed.

  Hi!

Just a hint for future patches: Please don't put version information into 
the patch description itself, this "PATCH v6 1/2" will now end up in the git 
history without its context.

Information like that should go into cover letters or below the "---" marker 
only.

  Thanks,
   Thomas


