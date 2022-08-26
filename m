Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2885A21F1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 09:31:38 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRToX-0000En-3U
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 03:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRTec-0002ZP-5z
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRTeY-00087t-Gy
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661498477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYwKrnz95+9+YuibNS7siTjiV3CuTizd1rsznL1nN5I=;
 b=QdCXxSWtWw9MRe2mzk9YcwqdChaYx4cwJ5htMxdxBC8so51cHHmzO10Jp/quhjhABhVixt
 n5X6XL1pyKwx+D+eHuICXmniQXycUahIpY204lhbA0ECjT+McReGhIphCNdB6c6l00sGcn
 Sz46HqyYgS77sNPO8wOHWcaohQFo+Zg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-m7-KgYpmPtuBpiTPNE-7vA-1; Fri, 26 Aug 2022 03:21:15 -0400
X-MC-Unique: m7-KgYpmPtuBpiTPNE-7vA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so625424edb.22
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 00:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iYwKrnz95+9+YuibNS7siTjiV3CuTizd1rsznL1nN5I=;
 b=0VZc2SpSSuJf4EkNcUzRiFl1YgwLLyHncEflqK4iwS5Y3PP9G6/Tcje2g5mDApS9cD
 AJg+inoKnkgMZFzI5Gj8K62UeUyjxKsNvvOAybpL1ECoCu6cLnKXa2R/7C1dYIxpTWTG
 o0KVzVezNU3B/nd7g1RwkUhmr9QQ2uQRHIPCJ5XJhUYrvjmi6sWGbwj6NnKH5VRRNCUy
 V7jowaCrMut3FcyWZM79jqoUbC/UgCWpk1wj1bGIwBDUfU5MZN+1etjJhBU1JuwA6zsp
 IUD2OZcCube5UTijsZsHZwZ61kRfVKsg2LK/rv9rnu4EOs8LkVA9lNhmzj+Skcxp1jPA
 jPwA==
X-Gm-Message-State: ACgBeo2BQl2haVfIAVKO7CFaaivLuPkzEeKxjY0NEN5oFBs8suXhh1AJ
 o9RzjFlpy2jJTT7kFpWgU8JWlUOl8bhGJkZ+Ae4kgrmRvIDrAiTeEVuH+Cwo7rqYKXjo81HUsSF
 h/KTDuhT5Tu4x4EC+ExND9shO3pUhVKYt1nXfZ73vZ6Yq0tqjCgTxYWmlkIGYkmM=
X-Received: by 2002:a17:907:da9:b0:731:1a5:8c66 with SMTP id
 go41-20020a1709070da900b0073101a58c66mr4599321ejc.80.1661498474512; 
 Fri, 26 Aug 2022 00:21:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6uHAnJ8Sf/CN4dyze6oU76UjG/L2HabHq6WdTIShWhzLF5Fj73tSvSst48fep3MW1AnVwtwg==
X-Received: by 2002:a17:907:da9:b0:731:1a5:8c66 with SMTP id
 go41-20020a1709070da900b0073101a58c66mr4599307ejc.80.1661498474169; 
 Fri, 26 Aug 2022 00:21:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-42.web.vodafone.de.
 [109.43.179.42]) by smtp.gmail.com with ESMTPSA id
 bs15-20020a170906d1cf00b0073c80d008d5sm526813ejb.122.2022.08.26.00.21.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 00:21:13 -0700 (PDT)
Message-ID: <c44e41ee-cdf8-a808-b685-fa43306b83f3@redhat.com>
Date: Fri, 26 Aug 2022 09:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
 <20220825225610.oio5h5bflp4gmaph@begin>
 <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: slirp: Can I get IPv6-only DHCP working?
In-Reply-To: <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 26/08/2022 01.15, Peter Delevoryas wrote:
> On Fri, Aug 26, 2022 at 12:56:10AM +0200, Samuel Thibault wrote:
>> Hello,
>>
>> Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
>>> It seems like there's support for an IPv6 dns proxy, and there's literally a
>>> file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
>>> whatever is necessary for TFTP network boot I guess.
>>
>> For which DNS support is welcome :)
>>
>>> Maybe there's no support then?
>>
>> It seems there is:
>>
>>      if (ri.want_dns) {
>>          *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
>>          *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
>>          *resp++ = 0; /* option-len high byte */
>>          *resp++ = 16; /* option-len low byte */
>>          memcpy(resp, &slirp->vnameserver_addr6, 16);
>>          resp += 16;
>>      }
> 
> Well, that's great, but actually I just care about whether slirp supports DHCPv6
> address requests. Sorry if I didn't explain that properly.
> 
> My goal is to run:
> 
>      qemu-system-arm -machine fby35-bmc -nographic -mtdblock image-bmc \
>          -net nic,model=ftgmac100,netdev=nic \
>          -netdev user,id=nic,hostfwd=::2222-:22
> 
> And then see that the BMC received an IPv6 address assignment.
> 
> But, slirp currently just supports IP address assignment through BOOTP?  I
> didn't realize that until looking a little closer at the code.

No, slirp support "IPv6 *stateless* address assignment" (if you haven't 
heard about that before, I suggest to google it). That means that IPv6 
addresses are not administered by a DHCP server, but that each client can 
built its own IPv6 address. It basically works like this (don't quote me on 
that, it's been a while since I worked with this stuff): Once the network 
interface of the client gets activated, the OS creates a link-local IPv6 
that can be only used for activating on the link (based on the MAC address). 
It then uses this address for sending a "router solicitation" message, and 
if there is a router on the link, it replies with a "router advertisment" 
that contains a routable prefix. The client then can take this prefix to 
form a unique IPv6 address and assign it to its interface. QEMU/slirp 
support this way of address assignment, see ndp_send_na() in ip6_icmp.c.
So if your BMC code supports stateless IPv6 address (it certainly should), 
you should be fine already).

  HTH,
   Thomas


