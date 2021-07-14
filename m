Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8FB3C8349
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:55:49 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cYO-0000Fa-EC
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3cWq-0007Dv-Jj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3cWn-0006rT-7Q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626260047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2iywdDCzSepggKQzVhJdhM/7s/cN3WSN0tJMIcZzVo=;
 b=UmJJS4HDq8nW+6zscDHzT08gKsLmzvUtvGUpFH8svjQ3QoamqvbNAfUSis45NUrpzbVrsx
 CE4z9V0aPKfa7KNUJUvx+Fbeg+LsBhSG0ehHCs5bjHvYZE9ayfKHIXkku/exGcvEFOv8jf
 IIfkPuZnHjkeOI41/nqmv2Yc9eSrC9c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519--ipTpJsXPeqQxUmDBE11rw-1; Wed, 14 Jul 2021 06:54:04 -0400
X-MC-Unique: -ipTpJsXPeqQxUmDBE11rw-1
Received: by mail-wr1-f69.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso1310189wrt.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M2iywdDCzSepggKQzVhJdhM/7s/cN3WSN0tJMIcZzVo=;
 b=Y8XDCV2mdSxxoBqR0JP1tPC7q3bFjA9nkL16TfdvXkzM72PlICSaGUs8ZHeFxzLXa2
 hXL1TkPsdM5g0Nll4PPHPC6iI/+uvPBLQwauakGKWNIc+cWJhPsn3uaWmWn2K2KEy1Yb
 FxckOJtQjDvop8m/wdveW5+CkoI9apJ/+Yf8DfPkavkkqot+FG8HBTTAhPhoq4nmkvsA
 iQgvGc9uX0lwofUFqpczYuY0jppHHX+ChDt5dvT+NQOoGoNzselSaj0Wgd7GnyHBnqBD
 Y3BZjJCPSkIbeIABjyTLBgDidERUAl8Kq0VBERljQF1rK8lQCQ2cIoDv46o+SnYxutpw
 E6Vw==
X-Gm-Message-State: AOAM530ltYUjRysjk5lsZCf70D8+G8g4TjxHaBG33R0sFuKLbhTCxFUq
 w0p9KNwFH563gYkkadlEOjWeqVBu56Zr0pOK2J6lC0aEB5+0nna7Ui2fLlbomOP2k0VimBjsZrH
 ABKFxY/LCCK2VR1A=
X-Received: by 2002:a5d:6804:: with SMTP id w4mr11869402wru.417.1626260043328; 
 Wed, 14 Jul 2021 03:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf3wa1ZNX/5wemOM3NwB1rRzfGimNFKr1f+WeNll1DkLdjAJRVXqJNWzoUFnaycvtLvCmujw==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr11869381wru.417.1626260043138; 
 Wed, 14 Jul 2021 03:54:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id e11sm2660169wrt.0.2021.07.14.03.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 03:54:02 -0700 (PDT)
Subject: Re: [PATCH] configure / meson: Move the GBM handling to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210713111516.734834-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20d2fcff-16b3-50d1-8a3b-3c9ba5544109@redhat.com>
Date: Wed, 14 Jul 2021 12:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713111516.734834-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/21 13:15, Thomas Huth wrote:
> +if virgl.found() or 'CONFIG_OPENGL' in config_host
> +  gbm = dependency('gbm', method: 'pkg-config', kwargs: static_kwargs)
> +endif
>   
>   gnutls = not_found

Tweaked to add "required: false".

Paolo


