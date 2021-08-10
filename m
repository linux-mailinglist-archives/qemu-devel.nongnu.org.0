Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C438F3E599A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:05:12 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQVL-0005lS-RM
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQTB-0002gJ-6V
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQT9-0005dS-Oz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596975;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/y07SwkZSkvmVfGoFhZniw5AGWmiYz5W6lTTykq1DJk=;
 b=QcVBQWQspbHxz81XbkBFLMenQxYScNX6OknAUtRkGEIpm/3XJps6V2eeU7hwMKCdK228d7
 k+WOixg7rZ2G4aLyAQJP2Im4V1a0R+O+01OEo5rQMcrUcKKZjnDS9immZpDJHAlB4zLv1m
 +1MYmjBtzoP7MnRZkHk/w1x0LXWijtE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-1k1NSnxoPUWfggqSdOS8Lg-1; Tue, 10 Aug 2021 08:02:54 -0400
X-MC-Unique: 1k1NSnxoPUWfggqSdOS8Lg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso976029wmy.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 05:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=/y07SwkZSkvmVfGoFhZniw5AGWmiYz5W6lTTykq1DJk=;
 b=dvsw9Nt/ZzCCs47DGm7ttGKNYGur75YLgpWbbbGFNiusK+4VDRikGi478BJZNeotoI
 0xRJrN6E+7gqIiLX2UPNa3WJlqUHArcNJBix4pN3hgy6KIYEA/UyxmQhufV2n2T0jcO4
 QAeWTRKVGQUmBCJzBnyr5WqCiBBwXnpb8iBGHs9VnWcnardl7HB0VYcHVhu3yxSF9J5f
 J/DxUBebfcU8mXxMP3p66gFBshUSFBIb4ixkW4FQS71nNTGuZkrcg+xC2KW+IPa0G/s7
 1fX0EiVdziupBqG4UsPpyBYUDsl6X6yyTxSyOHF/emn8oBFTjD5y9ogzwWWyeXWEoIST
 63xQ==
X-Gm-Message-State: AOAM5332nCRDg38AHNRWrvoxQZ/XCzyoyssxDCpXK2jEHeW1HZVhXAs0
 KIZU8xxdIO5mw4m1EBftukVkDmoOwFcOru7z78KRepUppI2lFK9K3Lo/9rY/INMF4f7GDKj7rxF
 Im8f4gClPHGTs8aw=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr21533379wmc.102.1628596972913; 
 Tue, 10 Aug 2021 05:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZb7CD4Eyc7P7pDm62NjmV2P1DNtVmuM95oPkWSSit79/uVVli86zIhCTZSgJVKvPOM06CGQ==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr21533360wmc.102.1628596972729; 
 Tue, 10 Aug 2021 05:02:52 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id r18sm5330997wrt.76.2021.08.10.05.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:02:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] audio: Never send migration section
In-Reply-To: <20210809170956.78536-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Mon, 9 Aug 2021 18:09:56 +0100")
References: <20210809170956.78536-1-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 10 Aug 2021 14:02:51 +0200
Message-ID: <8735rh1p90.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: berrange@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The audio migration vmstate is empty, and always has been; we can't
> just remove it though because an old qemu might send it us.
> Changes with -audiodev now mean it's sometimes created when it didn't
> used to be, and can confuse migration to old qemu.
>
> Change it so that vmstate_audio is never sent; if it's received it
> should still be accepted, and old qemu's shouldn't be too upset if it's
> missing.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


