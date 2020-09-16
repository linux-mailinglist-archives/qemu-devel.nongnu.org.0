Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37B26C068
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 11:23:48 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kITfH-00056q-UA
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 05:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kITeZ-0004au-Ch
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kITeX-0004fZ-1n
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600248179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MT1udzdfp4bDCcH0mZC4sNR2HPeZt4ewh98f1npBj08=;
 b=XHNMalYny2NuWekWAUPyLFXgcnSYqsBrKyt418HUIlDqt7WzJ3tPxbX4uP2qFGNkbDTQgc
 TxGFgmpFcGkJ41Anw+3ECS4XC/HA4zTfugfjyHAMcM46Lpe01xYsGgX3tbFHZNRCP9nI0M
 KQZiS27zebvGIn/DLul1ttBLiPgAs0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57--ogAyBjMO1etLDuv6MNlWw-1; Wed, 16 Sep 2020 05:22:57 -0400
X-MC-Unique: -ogAyBjMO1etLDuv6MNlWw-1
Received: by mail-wr1-f69.google.com with SMTP id v12so2311502wrm.9
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 02:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MT1udzdfp4bDCcH0mZC4sNR2HPeZt4ewh98f1npBj08=;
 b=h/wQib0ZwHrMoRJDtXBVT3HfKVeEohD3W0XSrP+tQYH+fqj9d1DM4UDxMrK6bFpYMx
 02CzAzM1LwA/0yuv4ntOUaoNrwGhNeapgQ/05h9j2uxN3LNPMcdwoq9CnsPGjmduN3Uk
 WxkZZ72uw/qTMO52st7g1mK3jbst3LWjDofQ73EKlFnl1BrtfTZ2DqdMOPEXDl7KO9g8
 4Y9rZewoRT7pO8R24sCojr1c0WlChRqJDMg6JFKY7LCGsoWB5kleZ0wvL1x77mOLdYuG
 Ouor9y2Kc0NYq/rFHdlO2FSmNcSmcEyJnSgQis0DaHgpIKKnB2S77CscGE+o0ZtjWfoX
 HUsw==
X-Gm-Message-State: AOAM533dHQsxoyGIrmdKEGyEtzxUCXA3jaW6yhMyb0U3VqgbZIA8SVsL
 JqxfcRrERR735fh5wjppTn4QhCyCaAV88ZRK1wNeK34WdINVe0EN86DtoeCEG1z0FqQnPQLS0B/
 8CJhv4gSFtWP/TMo=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr3587786wmg.164.1600248176765; 
 Wed, 16 Sep 2020 02:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytg5oQEAWxswNcZN6pe1TovGVFMU7t8tfDmeZ5vam/hXAXK19YcpiarnMwDl4hyBxVJV3+cQ==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr3587764wmg.164.1600248176546; 
 Wed, 16 Sep 2020 02:22:56 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id 91sm34930242wrq.9.2020.09.16.02.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 02:22:55 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] chardev: build spice chardevs as module
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200916083913.11902-1-kraxel@redhat.com>
 <20200916083913.11902-3-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4eb9e875-bfc4-21f1-8fdf-ced93ccc1f3b@redhat.com>
Date: Wed, 16 Sep 2020 11:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916083913.11902-3-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/20 10:39, Gerd Hoffmann wrote:
> +if config_host.has_key('CONFIG_SPICE')
> +  module_ss = ss.source_set()
> +  module_ss.add(when: [spice], if_true: [files('spice.c'), spice])

You don't need to have "spice" listed in both sides.  It is not needed
in "when" because you are effectively inside an "if spice.found()" that
is written in a weird way; and it is not needed in "if_true" if it is
listed in "when".

So it can be either

  module_ss.add(files('spice.c'), spice)

or

  module_ss.add(when: spice, if_true: files('spice.c'))

Thanks,

Paolo


> +  chardev_modules += { 'spice': module_ss }
> +endif
> +


