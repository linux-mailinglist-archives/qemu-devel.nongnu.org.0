Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7623ED6A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 14:41:51 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k41h0-00065z-JO
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 08:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k41gF-0005gJ-8F
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:41:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k41g9-0000zI-A1
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596804055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcmIDAaZfabtLg7j8PakAMc6CotpzpvU1OfmLZjGXII=;
 b=BfwSmzlrrLgLFWCLLAem2JJnJsFP8H3lswnE6jdWW6aEbPTjOpPYQepqC51uRS65oteXzx
 raPmLI/RjcYYYPy1sFC7FTyVOUbXffmkjRThZJOBdAyoGZImeWfm2DocGrHY/8PR0HHMvD
 0RqUjAxs/BXt4a20zkC0kuWi2Nk++sU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-6qF1sMrgO8yGmVlFZk_Feg-1; Fri, 07 Aug 2020 08:40:53 -0400
X-MC-Unique: 6qF1sMrgO8yGmVlFZk_Feg-1
Received: by mail-wr1-f70.google.com with SMTP id f7so710575wrs.8
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 05:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JcmIDAaZfabtLg7j8PakAMc6CotpzpvU1OfmLZjGXII=;
 b=fgwJIJz8DmX40/YBBkQFE7g8xDn6GFi02ueHMAwAgUj8jHXZ6tMBC0SKJDlVAsghqC
 T37o+36G9ejUyQ6L0S8/AvaBy3ubsJdJ3djzEOJC1eV+or/n5v+Skwh9YSznRrOBPIDO
 bWxjRwcqdLPO9Whuoy6F2T0+aPPn0ymc8laq9cukNUjkDsX3FRnIH6b6aI0m9MqsaY9A
 XnV1D9JZmfRIDNdUpLUN8H0HO2XftxYvVAA+Yih3ZvtMcOqRwkddgxD1oThGAZJz8hu7
 o5z37ai39YvOV5KoWRDv/obn7aEckPonjmnIFeEVhDdA0LIh4u3a05g/TGdOeq3+1a/L
 dfyQ==
X-Gm-Message-State: AOAM531NT1Vmt3Z+o6ypvNpDHNAiuP5aLeIOMJb5QpqOM0utRb6JUmDY
 /LVA4Efp+mhdmng3Dl7/lqcVxpnvlq/KJNCvnR0liiLTqnbapYQ8EMgi0gupEN2FbjPsUgPRDSo
 HnbT6iiC8plpceks=
X-Received: by 2002:a1c:5581:: with SMTP id j123mr12281365wmb.75.1596804052541; 
 Fri, 07 Aug 2020 05:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5fJKlHzMCZPjuY8W8vfAuJJYFwUE0wQnsjsho48Jlpf5ok0ZiZZ1y3WegBYj0astkaS+OQg==
X-Received: by 2002:a1c:5581:: with SMTP id j123mr12281351wmb.75.1596804052335; 
 Fri, 07 Aug 2020 05:40:52 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.136.3])
 by smtp.gmail.com with ESMTPSA id p15sm10096101wrj.61.2020.08.07.05.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 05:40:51 -0700 (PDT)
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <761b4058-7a2b-d992-2cc2-6efe654ee62e@redhat.com>
 <9c894412-b156-607e-1ea9-9e9ba14cbf1a@redhat.com>
 <6f6e9c9b-fdf6-951e-9112-3913fe44c455@redhat.com>
 <ac18da61-6f54-b9d4-7591-e1296f9d3a32@redhat.com>
 <353ff6f7-c67f-7665-b631-967512417fa2@redhat.com>
 <fa3570e7-1f2a-c44c-91f2-411c1f51e6ef@redhat.com>
 <d9cc3875-1780-5fcc-5c2a-5408e6aba2e5@redhat.com>
 <cd17b073-57bb-e121-f55e-c89f6e005801@redhat.com>
 <b20db8c2-3201-0172-b6e9-ca1f2c0ef05b@redhat.com>
 <80039400-81e7-9c14-60c5-839b0ea5aef4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e0056a04-1710-7676-fcec-1cf4269b7622@redhat.com>
Date: Fri, 7 Aug 2020 14:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <80039400-81e7-9c14-60c5-839b0ea5aef4@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:00:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, philmd@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/20 14:20, Thomas Huth wrote:
> Nice, we're getting there, now macOS starts compiling, but then fails here:
> 
>  ../contrib/libvhost-user/libvhost-user.c:27:10: fatal error:
> 'sys/eventfd.h' file not found
> ../contrib/libvhost-user/libvhost-user.h:21:10: fatal error:
> 'linux/vhost.h' file not found
>  https://cirrus-ci.com/task/5170197348745216?command=main#L810
> 
> (and FWIW, there are some weird "file: ... has no symbols" earlier in
> the log when running AR on the capstone files)

It's not supposed to build at all.  I'll check the "AR" errors and
Conny's reported zstd failure.

Paolo


