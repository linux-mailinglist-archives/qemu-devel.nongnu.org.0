Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011D66F1DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSMs-0005YF-Ej; Fri, 28 Apr 2023 13:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSMn-0005Xv-MN
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSMl-00052O-TN
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704723;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ss8cHQbcPChXgnYAwjWMkjadoQgC8klLRFhMUhOGLzY=;
 b=MZMDlHpsxeAdVVle69eKOMAMPqKi75oRGpWOKy2SQSr+W0OS/nPXa9y2v+9xW/7Zso5jY5
 rHfJebARMmdoQkayBU2fj1g2AgRI9IuL3fC1WqsTaQRLGQ2Wvqyvjqli5mrJJatc8ZVPcE
 P3KUfreabGV7yTlvuxzN58VWyvqOs1Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-V77umrDsOqmv9gYBX7i_7Q-1; Fri, 28 Apr 2023 13:58:42 -0400
X-MC-Unique: V77umrDsOqmv9gYBX7i_7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fa5d643cd8so4487f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704721; x=1685296721;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ss8cHQbcPChXgnYAwjWMkjadoQgC8klLRFhMUhOGLzY=;
 b=U+Yup+Vps5RtiaYjGFBJgHS1QgXxLtHG6cEc+X7bOjwQWjyVooqcP4ChIygdIhZ7aB
 tOQSvyoNmQHsSDFLDrGy5RO11+4LhEOEa8PQna7OABMv9iPhfbLeiwRpDZIh691w7wAA
 V6Jvg3wnk7PnvOIo19PzfsRzENzwZZJ0fJLpgS1Dyf4ABkKAtk69uZvpVTNCYGfKihrJ
 TXDxKKVn1XeMN8anCRtXSOcU0Ns79Z/X0cBP1T3hTOcWeKJ8adj0MCYui+A2ePdExxzL
 5mnxQFDTDJtWpwX8JJ4PpTJy+3v9kS9LYwQeGS9zLDtD+8MB4umDjWiRUVk/kT8z8b9y
 FuEA==
X-Gm-Message-State: AC+VfDzQTDaLzv4J6XWtYl+a2T+OrCdR8sx2/kqHQS/keyGpUX38YRY0
 a6wSmcDIK2odzJZlnQwhytSrZJyXZBPtMYddNpiRfyPmSbbdBqgMeXLjTh3DSY6Jvyc/brLYLLU
 YqSGYsW5fzpFm4rc=
X-Received: by 2002:a5d:4e12:0:b0:2ce:a8e9:bb3a with SMTP id
 p18-20020a5d4e12000000b002cea8e9bb3amr4902231wrt.4.1682704720837; 
 Fri, 28 Apr 2023 10:58:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4T8LQj92pM548T6TYN4+Zu5umWzFlPeO8qRm5qfsjbMgsudcLR38liNkcRAgmb8jdv5SEbfQ==
X-Received: by 2002:a5d:4e12:0:b0:2ce:a8e9:bb3a with SMTP id
 p18-20020a5d4e12000000b002cea8e9bb3amr4902193wrt.4.1682704720569; 
 Fri, 28 Apr 2023 10:58:40 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002d6f285c0a2sm21689084wrt.42.2023.04.28.10.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:58:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 06/17] sphinx/qapidoc: Do not emit TODO sections into
 user manuals
In-Reply-To: <20230428105429.1687850-7-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:18 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-7-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:58:39 +0200
Message-ID: <87wn1v7usw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> QAPI doc comments are for QMP users: they go into the "QEMU QMP
> Reference Manual" and the "QEMU Storage Daemon QMP Reference Manual".
>
> The doc comment TODO sections are for somebody else, namely for the
> people who can do: developers.  Do not emit them into the user
> manuals.
>
> This elides the following TODOs:
>
> * SchemaInfoCommand
>
>   # TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
>
>   This is a note to developers adding introspection to the guest
>   agent.  It makes no sense to users.
>
> * @query-hotpluggable-cpus
>
>   # TODO: Better documentation; currently there is none.
>
>   This is a reminder for developers.  It doesn't help users.
>
> * @device_add
>
>   # TODO: This command effectively bypasses QAPI completely due to its
>   #       "additional arguments" business.  It shouldn't have been added to
>   #       the schema in this form.  It should be qapified properly, or
>   #       replaced by a properly qapified command.
>
>   Likewise.
>
> Eliding them is an improvement.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


