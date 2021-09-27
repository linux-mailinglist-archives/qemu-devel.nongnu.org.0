Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A3419699
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:45:00 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrsI-0002hO-VY
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrnl-00075T-Po
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrnh-0002ip-T0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx77zwVhpbech2iljKv5d+EaZ6MiZEZLl5Cb4nG9fuU=;
 b=KA4Mz6Q0Nthnlejqrm12ZTX0IIUHS+8+mrjDdBoIp52+Gm7B5NqZ449vhcyGQQJuiu0fKi
 P+8lPqj/g+58QJzvSMIl0Cpx1GYikP8VOlJYalutvffgEXV/Kni0SfxzASPPS9YEUlS3cF
 drBSLuWgaCN+VHnrCbyP/2LJ5ERgzAU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-14KOod9KP96geUc6oU93SQ-1; Mon, 27 Sep 2021 10:40:12 -0400
X-MC-Unique: 14KOod9KP96geUc6oU93SQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so296319wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mx77zwVhpbech2iljKv5d+EaZ6MiZEZLl5Cb4nG9fuU=;
 b=SgwFKBnoGVvnnoINZM8W8CX//CdPClL6rsisBDH+/GDh00v25EoPjBsgAHoErcSje7
 y8aWF6ZWmr1JyqJPKgglPptdJzSbq77wmq+yiIshxaI0kPY3nVBUwpeN1HXcy+DWnRGp
 3ak2832NyrNBDMO6tkutnMo+FT3GT68IceCwNCxLSuSpCEJbzhyOQMBok2jNLulmGmz0
 aN/yWggE39192g3QZLarhK6e/p/4HqDFNrfQXsdeB+nJ7z/Uyg+4UDWwK6zaJ1fuSG1S
 5eLgTw13BTPuC1+fJ5aKHIySvDXVjBB9JK31VSZv68d7pJLnqSgfKTlHNMoo9aRyOGHD
 0FkQ==
X-Gm-Message-State: AOAM530BMPZlYdRJBczkIX7xeeAaiaJe1U5wRMJUkyhQ95e0oGMbEhyE
 LyXEH3twhPvC3+RLNLoDL3M9ta4AgXZV/wJsbE9XXZvINKWXj7ylqVuJHfIpo6wuozT4/D1fho8
 2fXlMmAqxINLujgI=
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr277574wmh.61.1632753610749;
 Mon, 27 Sep 2021 07:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7drvqcyp9i4GWegafMemW7jwF1EeGWudod6a6/Gtorpq5Mk1SfPKDFKQ5SQ02W8vsNn8R3Q==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr277542wmh.61.1632753610589;
 Mon, 27 Sep 2021 07:40:10 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o11sm9404721wmh.11.2021.09.27.07.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:40:10 -0700 (PDT)
Message-ID: <75fc60df-b9a0-a9e7-0c66-ffa84292ac18@redhat.com>
Date: Mon, 27 Sep 2021 16:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 02/16] Acceptance Tests: improve check-acceptance
 description
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:54, Cleber Rosa wrote:
> The "check-acceptance" make rule won't necessarily run *all* available
> tests, because it employs a filter based on the currently configured
> targets.  This change in the description of the rule makes that
> behavior extra clear.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


