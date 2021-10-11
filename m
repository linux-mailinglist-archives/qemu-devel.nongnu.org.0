Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A224742997A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:31:28 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3pP-00026u-No
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma3mH-0000oq-L2
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma3mF-0003Vx-PO
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633991290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbpLwm9pZznXJQT8rFPiD/8nq0Yb+qZxk1wkGmlHlWU=;
 b=exaOK2KhI9KLvOXsHK2f8liAJTVFFkSFCOJSvffiYFttGyXqML43m6gXO9DHF7Yaf/fub0
 t1+uEpDsfWSBSuKE2Wgi35Bv7W7iQLv/w8HxiVBe1qFFszVQQVAMJZn9AxLegE0WMC92kR
 0tzZlOY+c/zNB2PJ+xZnSq+vEJoLt+8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-fBlJcwtDNPyKjXx_LPtSDQ-1; Mon, 11 Oct 2021 18:28:08 -0400
X-MC-Unique: fBlJcwtDNPyKjXx_LPtSDQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso14248487wrg.1
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SbpLwm9pZznXJQT8rFPiD/8nq0Yb+qZxk1wkGmlHlWU=;
 b=BUL1xy11N6xof3RSQGrqa6akPyrASL35Q3EAgeZ4z2YieUVHipuzxxUZJ7PG2bjxTq
 OK9ggO607c7RdUtBDxl1N8bokvYs39psgyitglDO+4CahIPVR18e3Udfb/5kwS1RD8bF
 A4w0a2gHQrF8xEukx1n63Y/lNza2setXf/vw62rxGyJieAujAIY+U0BGJKTOGQaItDmh
 SOrAJFj3W1WA4p7NMGALIGzGhWXxXyXVdaK4LRO+xKRktMhVo7eQOCclvY2Kj+IGGJUE
 6+KHZlreiN2PPSfqHwquOZM8go4ddrTgzsgTkevQ6LqSp0evBPHGA+5q7cTqZDaI9v3r
 SRWA==
X-Gm-Message-State: AOAM531A3AgzpSjS/a2DT9CgrU8jCDd6/uA0828AZttZ9l7sEoJQC7tE
 3wQJMbzI2/IgxVuOrmequyC8xhr9ElxgikhhHLG2AlFYi9hmHgGXqJjj2FO+HaRLT9MUYmP3XtD
 NXBN2Ver0RpYG0h0=
X-Received: by 2002:adf:a496:: with SMTP id g22mr28793450wrb.13.1633991287818; 
 Mon, 11 Oct 2021 15:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUgbmn07wDZupLiid0qk7DOWS18LGcqL23a7HwKPWiAVfw+HgoOU3blWRgBbohWJduwochnQ==
X-Received: by 2002:adf:a496:: with SMTP id g22mr28793428wrb.13.1633991287643; 
 Mon, 11 Oct 2021 15:28:07 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id p11sm772376wmi.0.2021.10.11.15.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:28:07 -0700 (PDT)
Message-ID: <a3e15dc2-5c33-d785-7bb8-b70e1722ce3f@redhat.com>
Date: Tue, 12 Oct 2021 00:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] Trim some trailing space from human-readable output
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211009152401.2982862-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009152401.2982862-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jcmvbkbc@gmail.com, groug@kaod.org, jiri@resnulli.us, ehabkost@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 17:24, Markus Armbruster wrote:
> I noticed -cpu help printing enough trailing spaces to make the output
> at least 84 characters wide.  Looks ugly unless the terminal is wider.
> Ugly or not, trailing spaces are stupid.
> 
> The culprit is this line in x86_cpu_list_entry():
> 
>     qemu_printf("x86 %-20s  %-58s\n", name, desc);
> 
> This prints a string with minimum field left-justified right before a
> newline.  Change it to
> 
>     qemu_printf("x86 %-20s  %s\n", name, desc);
> 
> which avoids the trailing spaces and is simpler to boot.
> 
> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
> more instances.  Change them similarly.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c         | 2 +-
>  target/i386/cpu-dump.c     | 4 ++--
>  target/i386/cpu.c          | 2 +-
>  target/ppc/cpu_init.c      | 2 +-
>  target/s390x/cpu_models.c  | 4 ++--
>  target/xtensa/mmu_helper.c | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

Nitpicking, do you mind prefixing the patch subject with 'monitor:'?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


