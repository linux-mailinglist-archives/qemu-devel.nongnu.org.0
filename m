Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F443F9A35
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:33:19 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbym-0000ae-9a
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbvF-0006w8-0R
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbvB-0003NT-Sm
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630070963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdjmfHq8tMH8ml/U1PT+c+W1UCBgKR8MODzrzceQdxU=;
 b=OsOx8iLx4Af7GSmvJGtaieXbUE403a0ycOPunBvAh09sAoVG/I73wh0Kr4NMCtq4YjkJ3i
 EIDKp3jB2bDwzzdtRYSQ751pzWBujTfW+Jk6ynw97HbfXaovWDPPAD/8b7G6gU3vPyoQj+
 pqNd25hhytPD+raNFGExuuc0sMzplv0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-U5vfoRYRPl6psjzV9-0qnw-1; Fri, 27 Aug 2021 09:29:22 -0400
X-MC-Unique: U5vfoRYRPl6psjzV9-0qnw-1
Received: by mail-wr1-f71.google.com with SMTP id
 z15-20020adff74f000000b001577d70c98dso1836103wrp.12
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cdjmfHq8tMH8ml/U1PT+c+W1UCBgKR8MODzrzceQdxU=;
 b=bNGRGJcTBWDvfRv++sgPuCNIk9MkS21WJRjibHeD/ZrK/NpHHUP6MRY+7tff812/aS
 ea3htwdaZ+AVrC3+FNlzv+x1F/Ry5bIax81Te45qdTzE3CQtki7KuYQgNeuI+y2iklZf
 wfewr4xKyKzxtv084H5wp1l+VCjL9E9OcjS3uLAgU+QScAuvg75XebzK/qBvsbDVN9Qz
 1zqIFbSX8Y6s8mVmlgVj3JZ4eJ6ECaxRvmcwZdGhWuwGMp8tsH3hdFevWWoNrLhektlp
 Mlmk6mSj+mit/uQLDGFGnSo/CxqxNlwcJd/WPUI9j8wOB2VBaCLOfJOZ7rJbZHB+fSNw
 p5Jg==
X-Gm-Message-State: AOAM530FFT8yOl762uwPhlf5AYpK9NDWcPP5aVtoxS2FLZ19+N+LoDVr
 roKQyaEcQQvOJG1clFiPQDPEgmcbWyat3dPbiMpxW/aiYTPUErpKgXGIDWQDJeB/lhwc2vKputI
 p4FsX8JrkNQXm2eU=
X-Received: by 2002:adf:b745:: with SMTP id n5mr10500784wre.338.1630070961430; 
 Fri, 27 Aug 2021 06:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0MbjTToJebLLbqOaRzKmkDY8e1AgGbj7sAihA1VMoIW+GVetMziQc9n11u9kh7nNsuiRRLg==
X-Received: by 2002:adf:b745:: with SMTP id n5mr10500765wre.338.1630070961238; 
 Fri, 27 Aug 2021 06:29:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n1sm6222814wrp.49.2021.08.27.06.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 06:29:20 -0700 (PDT)
Subject: Re: [PATCH v3 01/18] ui/vdagent: fix leak on error path
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
 <20210805135715.857938-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56eabb43-ad6b-758d-fd63-956d9d26637a@redhat.com>
Date: Fri, 27 Aug 2021 15:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805135715.857938-2-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/21 3:56 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> "info" was leaked when more than 10 entries.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/clipboard.h | 2 ++
>  ui/vdagent.c           | 4 +---
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


