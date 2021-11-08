Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D15E447E03
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:30:29 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1v1-0001Cn-Us
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:30:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk1sd-00078I-SJ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk1sb-0005aa-8S
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636367275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ls5RbbNOUjuWI+chGOUCtqzb2ZMynFHtftzmjFQm85g=;
 b=SGA8Rwo5eobb1QyZkF/ldsZQaW47KkGk56uDJpulMUvT2zhlkf6JTFDLo5e/wO4+vfz2/D
 UJxRNPEjXsvUXAjh3ZnjhDAN0fJsRci89kibJDeXUjLuBwtLGn1v7gnEWxK/YJ4yDNbI+i
 0s1Lf0uVlTPAzrupv1W1Fm13wr4QmLY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-9Y5SgCrJOHuhgi1_ANAV7w-1; Mon, 08 Nov 2021 05:27:54 -0500
X-MC-Unique: 9Y5SgCrJOHuhgi1_ANAV7w-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a05640250cd00b003e35ea5357fso1297130edb.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 02:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ls5RbbNOUjuWI+chGOUCtqzb2ZMynFHtftzmjFQm85g=;
 b=NEcC1mBxruqWQvhaWa32GmGiRaI8AWh76DplBfloiChDzLcD5rAfmxOcWcXScYAscK
 lvcYWXpAOLlH6sVotpwvOMZhYCH49oZeqTuykumAjX+EhXuBfa+4gM5UR+6dD6VQCbPy
 YUZXL4B06E7X7zfCxh0HBhxQoyA03qjH9jUqLi84l6jx4ka1wXA3QK+255glF9VrjRZ3
 jCiOwFL2202so0J1usVxm29FvtjRWM+50nzSRiwyAa3Bp0DjIQHC8YlCPWWc3SddQn7p
 z+kLgr3QRKekUxhlyhqaMT93JDT7f+6dwNgTMQgbWWNazhVU5SEBiO2CSmPTkdgp31qT
 t1Mw==
X-Gm-Message-State: AOAM533tzu28tyHvPc5J56vNtvQSlwGAdcyXHHjdN/sFphTj+9xcBvCO
 uV6NwQMahpuWShj1EvmyAy0Fi2atck71EqDHNill8gUcjeu4uIttUXe+WHDMDlne1tcgyjl9iI6
 4T5Ebh00yLqMnMpA=
X-Received: by 2002:a17:907:77c8:: with SMTP id
 kz8mr96416517ejc.188.1636367273564; 
 Mon, 08 Nov 2021 02:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVi/fDscjK317C4pW/aLW8g6bkZ6yIIM19cvmrfc9S4roe9UK/vjf8jy6nhISbeSIIWPPlVg==
X-Received: by 2002:a17:907:77c8:: with SMTP id
 kz8mr96416497ejc.188.1636367273375; 
 Mon, 08 Nov 2021 02:27:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm2sm9000040edb.39.2021.11.08.02.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 02:27:52 -0800 (PST)
Message-ID: <109ff253-2ccc-2e9b-dc57-bba76ce46391@redhat.com>
Date: Mon, 8 Nov 2021 11:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Artificially target-dependend compiles
To: Markus Armbruster <armbru@redhat.com>
References: <87czneyaw3.fsf@dusky.pond.sub.org>
 <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
 <87fss9u3zj.fsf@dusky.pond.sub.org> <87ilx3nk5p.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ilx3nk5p.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 09:09, Markus Armbruster wrote:
> 
> Simply not poisoning the CONFIG_FOO when the FOO code is actually
> target-independent avoids the target-dependency, but also messes up
> introspection: new the FOO stuff is present for all targets when*any*
> of them has it.  This cure feels worse than the disease.

Yeah, seems like a case of perfect being the enemy of good.  Full of 
corner cases and harder to get right.

Paolo


