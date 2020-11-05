Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65552A80F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 15:32:18 +0100 (CET)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kagJF-00082O-Sc
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 09:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kagFf-0004CL-Ax
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 09:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kagFd-000405-Kd
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 09:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604586512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVBolGTz5ED9BWAMqo9tiqk+ngcUBBheOSll3dPz2Kw=;
 b=GcBDapH7VbKDtIh72O6/blq+Eo2J/YXbAoq/+LYDK52Sj0je+nJPsmokP5TgHlH+11RGiA
 FpsDP4UzCFOXqgoLgFNk9LXhiOwH+VHEiHPTatfMyGrSZHZd2Yolf1XUHw8TGCUQ52dWWu
 jXJq27LzOJpTYJ86PHLNmAw9qLXsueU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-W1qNCMcLM069zJzy4i5p2w-1; Thu, 05 Nov 2020 09:27:57 -0500
X-MC-Unique: W1qNCMcLM069zJzy4i5p2w-1
Received: by mail-wm1-f71.google.com with SMTP id t201so690528wmt.1
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 06:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uVBolGTz5ED9BWAMqo9tiqk+ngcUBBheOSll3dPz2Kw=;
 b=nT9KhzNe2T5hc6Kdd0C+s3B5fSvqb9Ky49CE0JmOgtbvlT4DiHdQg1lfLJG8PaPQ0n
 mbsPSxdEv27LYjS3xKKSGf5u2cjrt2o+a72Lf1XjcrFfHvfvXODyFMVVwbPc3qyhFPkd
 mLZVHJmQN3DYwRJNlZ9XXvQenCr45zkROSOAmnR6phYU+RbIU0oqyjHndQ9szG75g7ph
 Y3zF9Qflq8MWELJfzB6QXayn9sDwJk2MwIxc3x+t28HJ6WjZ4NNuXNRBbwabd9uHQ8Uo
 sRqqoKr93srQS1/inllHHP+FJCplmSu1kWFQ7EfjHHBCotxITkkwUPrzZatEw8Ds8HGe
 bvmw==
X-Gm-Message-State: AOAM530nsUqQ3Yvy04birEjYnUnkROsJK8IlVFfE7u7Sulw1eNKy9OOi
 hrfX+Ce1MUOkq7zYtNBepGkeRntKNw20JvK6qUdZZusHw3Zk0/bgdBEzUIBPH549Hjvi2Tndmi6
 TiL0wr45KzELYXLA=
X-Received: by 2002:a1c:3142:: with SMTP id x63mr3021654wmx.168.1604586471721; 
 Thu, 05 Nov 2020 06:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpwqW/y85DLhVAP3ZCjyZ7XwjcEQudL8X66lJ7Fc7oZjiMRYEMiSl/yOXp0SEtubLUjdeeaw==
X-Received: by 2002:a1c:3142:: with SMTP id x63mr3021634wmx.168.1604586471537; 
 Thu, 05 Nov 2020 06:27:51 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g66sm3003587wmg.37.2020.11.05.06.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 06:27:51 -0800 (PST)
Subject: Re: [PATCH 3/6] usb-storage: use bool for removable property
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20201105134112.25119-1-kraxel@redhat.com>
 <20201105134112.25119-4-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <892644fb-cd3f-c9d8-a22c-99a4f596a244@redhat.com>
Date: Thu, 5 Nov 2020 15:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105134112.25119-4-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/20 2:41 PM, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/dev-storage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


