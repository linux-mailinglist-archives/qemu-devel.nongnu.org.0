Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3836D8FB3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJQQ-0007sw-Ap; Thu, 06 Apr 2023 02:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkJQI-0007sP-Dn
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkJQG-0007qU-ES
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680763719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVOQpfL2DT7dQmDmo+HQ8Stl3qcXFfgaFsZyrhGjzsg=;
 b=h9wsKZX7ukKbqa5yo/bmFxlMb+rWHer9QPmusLysVA+qCTjPPxPTNcB7NsMrzUCEOaAHUc
 X23J6YukLfCM0ur5RzNk+QWcXnb8ZvLYQZg3huFa7Eb8GSvTsAzOQ93H0EFw7TnbEi7wUo
 atWRl6lUbBKyJFiFDnNcGAZIWZpWXgM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-zksmgcdoMHO7tI9NqA4Dxw-1; Thu, 06 Apr 2023 02:48:37 -0400
X-MC-Unique: zksmgcdoMHO7tI9NqA4Dxw-1
Received: by mail-qt1-f198.google.com with SMTP id
 c14-20020ac87d8e000000b003e38726ec8bso26134245qtd.23
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 23:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680763717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVOQpfL2DT7dQmDmo+HQ8Stl3qcXFfgaFsZyrhGjzsg=;
 b=j4BR7Dye5xZzRNKKIY/8Ew48PAJ/UhNwylwfOcQYW0zSY9Sr6kBm6JdnNRSCb8P9uF
 XxttemQFvOb6r+Ur2tYaosmkIcSjqOgocPnOU0SbIZwpROoFsRKSw3rIAALF8UBWnw4j
 lMTlvNDlQA9PmIgnpD9t6YzaUg3HOsgzGeR+9MkHbhlhiVRS33GD05ipyHTPqTulO72w
 de0CMmeD65z9zrT4C9wKwTB/Kd220n+4Uo/lzei0GxF11FRuLJMYmBQp4rFQtsZB46fJ
 WCfiVW6dlnLX/+FfvXsYV0jpG5GsbQuwAwJU433k5uKF6WwrznDzbUt2GjygjdtWVvUt
 XplA==
X-Gm-Message-State: AAQBX9czNb3KbvlEMqCe81ucetAPUa+T4Oi+NiXUWsbSZQ/+soVAGlI3
 j3FSRCbcENLIMclWvcPW+QtfSsOsaZestj1ZrVC6230jNUG303Zs4T9crg7wIl0duRDKQNrMITA
 hn6VBnhO5Vb9MRDM=
X-Received: by 2002:a05:6214:246a:b0:56b:ff69:7df8 with SMTP id
 im10-20020a056214246a00b0056bff697df8mr2808865qvb.51.1680763717374; 
 Wed, 05 Apr 2023 23:48:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZU9jPalKTErPoO/UKImLmuJCx3IJ5i1he1FSbTEnaxCXN591flejedpOSVAKq3ssWd0anGng==
X-Received: by 2002:a05:6214:246a:b0:56b:ff69:7df8 with SMTP id
 im10-20020a056214246a00b0056bff697df8mr2808857qvb.51.1680763716991; 
 Wed, 05 Apr 2023 23:48:36 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 ks15-20020a056214310f00b005dd8b9345e2sm290193qvb.122.2023.04.05.23.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 23:48:36 -0700 (PDT)
Message-ID: <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
Date: Thu, 6 Apr 2023 08:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: QEMU stable 7.2.1
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Michael Roth <michael.roth@amd.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
 <20230405210658.yg2i6grklgqp73rr@amd.com>
 <9d2a753d-0b50-8fa4-2a71-590fd5ffd22f@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9d2a753d-0b50-8fa4-2a71-590fd5ffd22f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/04/2023 08.33, Michael Tokarev wrote:
> 06.04.2023 00:06, Michael Roth пишет:
> ..
>> Re-packaged tarball based on your 7.2.1 tag is now uploaded:
>>
>>    https://www.qemu.org/download/
> 
> Thank you Michael!  Finally it's there :)
> 
> There's one minor caveat still, though: it is missing in the
> "Full list of releases" for whatever reason.  Dunno how that
> happened, maybe that page hasn't been (re)generated yet.

FWIW, I can see it on https://download.qemu.org/ now.

But there's another thing I noticed:

On the homepage and on https://www.qemu.org/download/ the date of 7.2.1 is 
still the date of 7.2.0 (Mar 30th 2022) ... do we want to update this, or do 
we want to indicate the original release date of 7.2 there?

  Thomas


