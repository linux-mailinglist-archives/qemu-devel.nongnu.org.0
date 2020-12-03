Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74F2CD4B6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:41:20 +0100 (CET)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmz9-0006fr-6h
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkmwz-0004V2-A0
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkmwx-00009x-Pp
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606995543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wh1Ywp004YRx+FWiOiCZ8wji1VDS9IUoXXtWJwGle4g=;
 b=FegaNuHjNaSkVzzc2dVXYkOTc3ic6D5tE0cENqxM9cygBmLnvnx5fqq+QH3TCkbBoz2nsF
 yMoqw9+odTZMstcU6HO1jG8JHmbzgUeFlSn+UbwBwXytB/qwcQlNMY2TqYkK43WjdvirNL
 LiuK8TyyUP6EwlJU2zIlatMC6AUYAYc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-ESwGf_NoPbmHkg1j6Kz1ZA-1; Thu, 03 Dec 2020 06:39:01 -0500
X-MC-Unique: ESwGf_NoPbmHkg1j6Kz1ZA-1
Received: by mail-ed1-f69.google.com with SMTP id c24so829850edx.2
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wh1Ywp004YRx+FWiOiCZ8wji1VDS9IUoXXtWJwGle4g=;
 b=n2JRXJKZeK/FdBrTZwV4y5KDgAJapp7fH2C1jbFHx7V+4FGtTxr+la6wpSQBChGwlW
 6rKU+3SNVSd38q01Qkk/M2P/oM2V9hSaVoB+YDZbg842nu7/0VbjQ65OACsT7hJ7DTn2
 Caag3H25DWENIxGmIrxyheaEiWQFd2wV59mv69vjKnH1F0Pn2C4hqRfpvyIjPSDvIx0t
 SeZkxuNTHQFlwalWsa7OtAhLofZXLRSx47RZJr8LNVuWfqeD7t5SPZalACKhCynFqJGL
 BvStVR/9bTH1gUjRH3mBbrlBwhJ2vEBYQ59cvHoFO7zWcNGnjauetIwA9rfpGctsCjt/
 Fdbw==
X-Gm-Message-State: AOAM530Dug3qXY88ODKBF2fnL4bhgehdshOMRKWr8YKvL2yJBzJAGWzl
 bn5/D9syxPZElb14MuQAQZZIsiIucIXWhKLsap3j3KLXnxRuc7vCmc13ETerlfnHhb68U8MZ8Bm
 tEZ6VCANwzJJQ0QU4Ou2kik6BU+JjHKNASwFStGIi5LD3b+c2mg0L6QAg+1TswfIV+L8=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr2420943eds.155.1606995540158; 
 Thu, 03 Dec 2020 03:39:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTHScEcYazYHYgt85yk0ysCZo+ryv13f5MSk6OmBLOchV64ofjq4bq0q/pDlgZ99bNAp97Lg==
X-Received: by 2002:aa7:da03:: with SMTP id r3mr2420928eds.155.1606995539968; 
 Thu, 03 Dec 2020 03:38:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z26sm991246edl.71.2020.12.03.03.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 03:38:58 -0800 (PST)
Subject: Re: [PATCH] docs: set CONFDIR when running sphinx
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201201183704.299697-1-marcandre.lureau@redhat.com>
 <cca70efa-d001-f4d5-f019-5ec55b7a4349@redhat.com>
 <20201202195508.GI3836@habkost.net>
 <CAJ+F1CLr9Hv+w-uenYRVC_wm=uBf7_Jx5nY5gTjvWXo9O032QQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <913d605a-2e7c-7897-33af-be0e5c18b6be@redhat.com>
Date: Thu, 3 Dec 2020 12:38:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLr9Hv+w-uenYRVC_wm=uBf7_Jx5nY5gTjvWXo9O032QQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 11:28, Marc-André Lureau wrote:
> Note that the original bug that prompted this fix is about qemu-ga 
> configuration though.
> 
> Paolo, please queue the patch. thanks!

Done.

Paolo


