Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5343C285
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:03:58 +0200 (CEST)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfc2X-000345-FY
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mfc03-0001Ds-BX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mfbzz-00077Z-Mn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635314477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDpDVsbohNBw3tWpZpv0d5SfKHlOxjfRpNfMzf+qghw=;
 b=fx5ODnsaIRtoXreJgyYoV5caCwCktEBJ1SgQYIftAxy0xs724aRe8zJvDyMHaiPNlyygPp
 +Dewoy0h0md6eXhbsJS/00MojAAwoAQNMf/vy8K8lTp2tsTfmAW2At2V1VLrk5ImUkVi4z
 xXHBvvLXM27yprmU/SzY1EIvLXSemww=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-wkgNWqeENWqARh8DPdoTgA-1; Wed, 27 Oct 2021 02:01:16 -0400
X-MC-Unique: wkgNWqeENWqARh8DPdoTgA-1
Received: by mail-qv1-f69.google.com with SMTP id
 z8-20020a0cd788000000b00384d92a0f11so1297791qvi.17
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GDpDVsbohNBw3tWpZpv0d5SfKHlOxjfRpNfMzf+qghw=;
 b=hPkpFNTgzCcZ8R5X+7dbA/qIYPgRyDOecpWMR2c95xCybBPzJH5O7JoEqGWxWnpyV5
 mYuWz4V+gPulPATUsMzKrAwq/jJ26dr9ivmNeWZ6ZqpNuGjumMxiqLh7dQb6GZTT1NzQ
 vjAM6JK5wL+DINgIYY/m/kvQ1PBc0fr7CDYbZuTcPsFB9ZuGf/+VZfb9pJd4gCR26N/0
 GgDCQCMZVYU45mTLsynHT49O9op9ByvGodh7IXFhY4ENbDZ4/qBKgPIwWq4pWkbaaxL0
 KqESmx+TCekM1VuPTncYeTP9XsDwDlIbWwS24FU3zah5Zm/Epo/j402bEB9fB28bx0un
 JQpg==
X-Gm-Message-State: AOAM530TRaeHNObxkoL21aoCXuJlEggnXhj1qCdgxFlmC7POzutkxoPB
 jjyR635OkD+OGfo/cEpFpBo/fmqCzhquSb96HYHdlkzqjz4O/zC4p5JxOtC574Dg7SQuIrN9KYL
 SjZramieWYAdoRP0=
X-Received: by 2002:ad4:5403:: with SMTP id f3mr27752566qvt.31.1635314475278; 
 Tue, 26 Oct 2021 23:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM+4mAr2f1YAgR2bvYt2/uDS9XZ2pYmSc1e4uKurg10IxdHQRLwsBqj0N6yZC3GRbQvPkb1A==
X-Received: by 2002:ad4:5403:: with SMTP id f3mr27752537qvt.31.1635314475132; 
 Tue, 26 Oct 2021 23:01:15 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c24sm2151799qkp.43.2021.10.26.23.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 23:01:14 -0700 (PDT)
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
Date: Wed, 27 Oct 2021 08:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026145509.1029274-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2021 16.55, Philippe Mathieu-Daudé wrote:
> Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
> to be stable. QEMU repository workflow pushes merge candidates to
> the /staging branch, and on success the same commit is pushed as
> /master. If /staging fails, we do not want to push the built images
> to the registry. Therefore limit the 'docker push' command to the
> /master branch on the mainstream CI. The fork behavior is unchanged.

Hmmm, what if I have a patch series that updates one of the containers and 
then also contains a new test that depends on the updated container? Won't 
that fail in the staging branch now and make me look bad?

  Thomas


