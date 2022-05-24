Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE379532F91
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:23:09 +0200 (CEST)
Received: from localhost ([::1]:34546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYFR-0002Xf-0U
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntYE5-0001Nw-Vu; Tue, 24 May 2022 13:21:46 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntYE1-0006AW-PR; Tue, 24 May 2022 13:21:45 -0400
Received: by mail-ej1-x630.google.com with SMTP id f21so23057199ejh.11;
 Tue, 24 May 2022 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pCZc2GZ7ce+m7uO2uTr8Fps01j8ntxHNbwvLL3iphs4=;
 b=o394bzoJ1sYtq+wkQrvDRDIJx7eQtQ26Xqh8L3K5K2O6kfrE4vYhkIgSeWE4BD9+Mc
 m5o2a6nWSjR0J/2bT9Kv3tR7TRf2ExlpViC0fnUCMsJR9pQiNsrNv775aqZEy5R68wsC
 2xXAN/RTI+ikGE052tmXhzc9vu/XRUnzhm13ol0H2eBQO3DJw0o2SxY+qhgu1tll65mP
 hDnDapqx6ID66xOoOEODLtA22S8sQUy5UKXJLL2YKtuDM3TSIpM/w3IxJPcxf6Lmp0B5
 htMUMaTSnP/VRhmHnxKRz7HX0mZl1w5Eg0rBm7KpplL4G6rWd4+/SkX2OdelDm/N6hSa
 mDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pCZc2GZ7ce+m7uO2uTr8Fps01j8ntxHNbwvLL3iphs4=;
 b=0TbytpXwk2ZQFc55hG/du5sR8pj9HfIZib8CTR35XcLrt7bd1qSHDtel2UFphKHu6I
 1Eb+AV4h+st3/wl02USoVlhX8KAYiobfoxjlrahrQCvZL/b+Doqq13k9TaK8E2rcS8of
 0d8vyH/qqXOeMJfckTGO2NO1CW5YimdYs2leF7foa8eFLdPLgyqGyIqUYzZ8bldL71WU
 d0TGOACNrnXIQ0mp4zdZDMXO+W+Y40sxmjtTV2F5cC8c5ChjVA9rIfM4Uc+WmKHHQJFX
 I4TnjAKjpc18pEiv2pDB2QeYUpfy1/4TFnARxxThoEySkS5AqojhdvaaXw/PPUAiPh07
 TZag==
X-Gm-Message-State: AOAM532ma8p4XLfAJrzyeAOvxRJXclwm10qAqUGjRiQ87NfNPhKLyy3y
 peIuH/eA4qoRC5cn+eZYEsY=
X-Google-Smtp-Source: ABdhPJzShWdZfxU3XvncRj6xYRAwRe6XVOtd9iSek8V1AEKIOG+EhA+clgJUk/6L5nB5dZVoYxmUgA==
X-Received: by 2002:a17:907:8688:b0:6fe:c083:75e1 with SMTP id
 qa8-20020a170907868800b006fec08375e1mr15271724ejc.734.1653412899380; 
 Tue, 24 May 2022 10:21:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 w9-20020aa7d289000000b0042ae2d4e2f2sm9634479edq.86.2022.05.24.10.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 10:21:38 -0700 (PDT)
Message-ID: <84c5fad5-9e8c-84df-9aad-90ab1b79a5db@redhat.com>
Date: Tue, 24 May 2022 19:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: aio_wait_bh_oneshot() thread-safety question
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
 <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
 <YozSW5PT4L//qVOk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YozSW5PT4L//qVOk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/22 14:40, Kevin Wolf wrote:
> Why is the barrier in aio_bh_enqueue() not enough? Is the comment there
> wrong?
> 
> aio_notify() has another barrier. This is a little bit too late, but if
> I misunderstood the aio_bh_enqueue() one, it could explain why it was
> never observed.

The missing one that I (and I think Vladimir) were talking about is at the
end of the execution of the bottom half, not at the beginning:

/* Context: BH in IOThread */
static void aio_wait_bh(void *opaque)
{
     AioWaitBHData *data = opaque;

     data->cb(data->opaque);

     data->done = true;
     aio_wait_kick();
}

void aio_wait_kick(void)
{
     /* The barrier (or an atomic op) is in the caller.  */
     if (qatomic_read(&global_aio_wait.num_waiters)) {
         aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NULL);
     }
}

where there is no barrier in the caller to separate reading data->done
(qatomic_set would be nice, if only for clarity) from reading num_waiters.

Paolo

