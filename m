Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729C37D363
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:21:18 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtTx-0008Ag-3O
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtKb-0003S7-Qs
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtKa-0007RD-Be
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620843095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/InOq3ddYVnWkIRvKu2eSGmrlsoS4wFzSKtFg75uno=;
 b=dmHgkcb6hH13BTxU7lgLqCUAJv00p4IaK9jsHsj9C6DJo0UK85qu3gzvOp/VMrYggjbtrU
 ZDYFWWXeqBTRJq6QfMHbNLvCy6c3O5Kc3QOccKeWJkzoBXT35hruQTuLUQUAVptGirXYib
 3CconLi/Nawfd7acPpm0/mz/iO/EoVY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-3d8aX8bsOsGIfIoLYnLFKA-1; Wed, 12 May 2021 14:11:34 -0400
X-MC-Unique: 3d8aX8bsOsGIfIoLYnLFKA-1
Received: by mail-ej1-f72.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so7507065ejc.15
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/InOq3ddYVnWkIRvKu2eSGmrlsoS4wFzSKtFg75uno=;
 b=W9PwNj/bYoBW5N9JtqaXn7jkorxslru+Z8HiQSAwt8nffm2MYzRQEucExl5i8j51mG
 HsoqY/LIzJJ5Pk3+TMLJjOoHwOnTEDF8qg1FA9pTLyGWjgwM4k3cHwzDZXZJ7n591xGP
 7eg4BbeeKcuDYG1QZktNyOLdg6U1P+IVyfsIMAXFqrSQ1cRUpRISHRSd0Uf6/fz8hKmW
 cKwOdgi57HcRp8cVa3I4E+VvJIsuklntxQbBsaCo6E8AAZx0vfpM2TrR1HuDkRXkTByd
 efRC44euW99vx1zwA7s/Yblnr/2xtL6zo2JHDY83HnTr3trgZJ5PI/zFGlDFM3Gkh0Eg
 DXNg==
X-Gm-Message-State: AOAM530rEQo3O1+Eqhdo03YKfeHE6ZcnQXrIVSosJfSfFRQlQUbalvwC
 a91MUjoC36E66dpqMd6+Xx5BcwLNfF/qrwBXlNuV3PCcT59GD4FZSK5ml/uOJqnE+PYxb8vIjWL
 3n6cQYGbHO5wCuqg=
X-Received: by 2002:a17:907:1c98:: with SMTP id
 nb24mr39139443ejc.206.1620843092923; 
 Wed, 12 May 2021 11:11:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1s1nX5cMGQPWs9MhiJT5BJZET9Qvu+gLWbgivtkM5ibghLYU1X/S8UNU7tqdE60HqjWh3JQ==
X-Received: by 2002:a17:907:1c98:: with SMTP id
 nb24mr39139420ejc.206.1620843092732; 
 Wed, 12 May 2021 11:11:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs8sm305420ejb.17.2021.05.12.11.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:11:31 -0700 (PDT)
Subject: Re: [PULL 30/33] migration: do not restart VM after successful
 snapshot-load
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-31-pbonzini@redhat.com> <YJq5s+VJC52n+RlV@redhat.com>
 <YJuHg6CteFx6c9fJ@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7eea3e73-88df-f7b3-b102-998176296353@redhat.com>
Date: Wed, 12 May 2021 20:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJuHg6CteFx6c9fJ@merkur.fritz.box>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 09:45, Kevin Wolf wrote:
> I guess I'll wait for this new QMP bug to hit master, and then rebase my
> fix on top of it, with now two Fixes: lines.
> 
> Or do you want to send a v2 of this pull request without this patch,
> Paolo?

I managed to remove it from the tag before Peter pulled, so problem averted.

Paolo


