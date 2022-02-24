Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432A4C2B1B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:41:59 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCVS-0003L7-3A
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:41:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nNCT4-0002Uw-Fs
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nNCT1-00056n-9T
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645702764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPlyPN2IhLvd384IKcTjznOHTrNObUr9DIyQadnQ+EQ=;
 b=d+BfgsGuTLbEIFJ0Umrhc49zNInMFz9/UBth8Y9PlVnrOFbBmAofMM7qOuBtj+ndN86nJ2
 gaGG4TyLlV8WU9aZhya7hTosSmN03L8leg1cskkYuUFu9OD3CbRSCj+6qnLK57oohf5YpF
 axDkhoVtAE9vZlp1bT34H2St/LPKniM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-WBQssRukMey5Pr0Bla7O3Q-1; Thu, 24 Feb 2022 06:39:21 -0500
X-MC-Unique: WBQssRukMey5Pr0Bla7O3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19195801AAD;
 Thu, 24 Feb 2022 11:39:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.194.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07619100687F;
 Thu, 24 Feb 2022 11:39:15 +0000 (UTC)
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
 <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
 <20220224101020.2dd35c16@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b1dfae81-6286-9596-fa2d-860b85f37a52@redhat.com>
Date: Thu, 24 Feb 2022 12:39:14 +0100
MIME-Version: 1.0
In-Reply-To: <20220224101020.2dd35c16@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Idan Horowitz <idan.horowitz@gmail.com>,
 Oleg Vasilev <me@svin.in>, Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/24/22 10:10, Igor Mammedov wrote:
> On Wed, 23 Feb 2022 12:50:42 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>>   Hi,
>>
>>>> Also, "make install" installs these EDK2 images, which doesn't
>>>> seem like the right thing for "this is only for one test case".  
>>>
>>> Well I'd prefer we never had them installed. Today I don't remember
>>> why it ended that way.  
>>
>> Probably to behave simliar to other firmware, which makes sense to me.
>>
>> So maybe do non-debug builds for install and debug builds for the test
>> cases?  Why do the test cases need debug builds btw?
> 
> wrt bios-tables-test, it doesn't need debug version and should work fine
> with non-debug builds.
> (if memory serves me right it's this test case that prompted to add
> uefi images to qemu)

Yes, commit 77db55fc8155 came first, commit 536d2173b2b3 came later.

Thanks
Laszlo


