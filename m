Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C76D1AAB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:45:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piAN4-000769-Fu; Fri, 31 Mar 2023 04:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piAMz-000761-Gw
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piAMx-0000ro-FF
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680252262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iT36bl2LveGyDzR/VSDPins2A5GJhwuqw4RWQiaB99k=;
 b=LA5YWtaPqGQ+5KgXaEALL92qJ4VcWdU9yU0WRnbdmPU2VxYe6pCs4vBjR8Aqx1XKMtoYdP
 qTfuTPC86YZBxEPtxA6ucNaDXaQzb8u9kE7UspX/Z+2nrbs4JBOX/vN3HYbOaFQ2/sXEv2
 emU3GN/dNiojbFqBxCWBYuEvhFs1E1k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-9EQuRR5HNkqHxAznIGjpgw-1; Fri, 31 Mar 2023 04:44:20 -0400
X-MC-Unique: 9EQuRR5HNkqHxAznIGjpgw-1
Received: by mail-ed1-f72.google.com with SMTP id
 m18-20020a50d7d2000000b00501dfd867a4so31124161edj.20
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252259; x=1682844259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iT36bl2LveGyDzR/VSDPins2A5GJhwuqw4RWQiaB99k=;
 b=nzlCkpbRJHVKK1cMR4fcR2uZuAqDYbRDa6iVRDeKb1SPCK0WJAaTeRgfSDPcTEqKiK
 AaE3lRul/dfIt83wjxqjpIu/aftW7yousvLZrNN7lvKFeKx2vjLX5BN36EOcMRtygZj8
 0vhHLTZuOttkBxII2ojD0YjymOhl43ZUICo/9N9izm+i8jvATiBEiHab0FINZ0+XArQq
 GkLkafgvbwjuD0HxMMw+KFTBlH5bo77BBrB+A/cNYuzU/PePUshIqzN4kUTI2TufhH3V
 kaItvAgFZpqOt9bE21WzYoiOdwqvOc19HN1dXZ6Smp6lMZJFGXHM5eNCqmiZR9GbOqib
 AcOA==
X-Gm-Message-State: AAQBX9ehzPWBz4lTkuYj+GqAcPgZXShYpJVbrMJZZu4/qeGze0Xbh638
 yoqRIe+iUJ/CGk+rmGWNB3ayXxBBzrX53t/gCqd3u6uxVSEH6ANuSDXDtifereBdha3wXnr0lcF
 sDL40qynpXU89fTA=
X-Received: by 2002:a05:6402:1044:b0:4fa:eccd:9849 with SMTP id
 e4-20020a056402104400b004faeccd9849mr23350780edu.9.1680252259587; 
 Fri, 31 Mar 2023 01:44:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350axInEpM2o5OfpCjNiO3a03conrJktyQ9A+nbfN0MrE0p/cfLumS6cD6oZNQlJVyjgtgZ15hA==
X-Received: by 2002:a05:6402:1044:b0:4fa:eccd:9849 with SMTP id
 e4-20020a056402104400b004faeccd9849mr23350767edu.9.1680252259338; 
 Fri, 31 Mar 2023 01:44:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 u25-20020a50c2d9000000b004fbdfbb5acesm774213edf.89.2023.03.31.01.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:44:18 -0700 (PDT)
Message-ID: <7f39388b-1689-c40a-9e2f-861408dae7b8@redhat.com>
Date: Fri, 31 Mar 2023 10:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
 <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
 <CAFn=p-bu1nhw5-PdtxZ2U=PA5uq7VTrgW-W8boh29JRHxSVTyg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-bu1nhw5-PdtxZ2U=PA5uq7VTrgW-W8boh29JRHxSVTyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/30/23 16:00, John Snow wrote:
>      > +                yield {
>      > +                    'name': entry_point.name
>     <http://entry_point.name>,
>      > +                    'module': module,
>      > +                    'import_name': attr,
>      > +                    'func': attr,
> 
>     What about using a dataclass or namedtuple instead of a dictionary?
> 
> 
> Sure. Once 3.8 is our minimum there's no point, though.

Well, that's why I also mentioned namedtuples.  But no big deal.

>     BTW, another way to repair Debian 10's pip is to create a symbolic link
>     to sys.base_prefix + '/share/python-wheels' in sys.prefix +
>     '/share/python-wheels'.  Since this is much faster, perhaps it can be
>     done unconditionally and checkpip mode can go away together with
>     self._context?
> 
> 
> I guess I like it less because it's way more Debian-specific at that 
> point. I think I'd sooner say "Sorry, Debian 10 isn't supported!"
> 
> (Or encourage users to upgrade their pip/setuptools/ensurepip to 
> something that doesn't trigger the bug.)
> 
> Or, IOW, I feel like it's normal to expect ensurepip to work but mussing 
> around with symlinks to special directories created by a distribution 
> just feels way more fiddly.

No doubt about that.  It's just the balance between simple fiddly code 
and more robust code that is also longer.

Anyhow later on we will split mkvenv.py in multiple patches so it will 
be easy to revert checkpip when time comes.  For example, when Python 
3.7 is dropped for good rather than being just "untested but should 
work", this Debian 10 hack and the importlib_metadata/pkg_resources 
fallbacks go away at the same time.

Paolo


