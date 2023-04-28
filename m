Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BF6F1E15
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:32:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSrt-0002ZF-Pg; Fri, 28 Apr 2023 14:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSrs-0002Z2-3J
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSrq-0003YE-M9
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682706650;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/s7kj0Fm3Lz7GeGStOsZoK5fmFZ7rSy3F0/tHqUHWn8=;
 b=BhMLu3fb6+hWiy8naW1/QvykM+NHxR6dDmvmAHHZcGytP9QLBIofKTEOSOV8KuoZAIfsBF
 biVIDpPqqXQnHySnOTNM072g775CVlbk13+XcaNnwamaB8ebdQtm0E1IagNu+ofhMXZ/3U
 iYdKZ/x1XPogNj8m1z3H+K99WIUXEns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-MUKaoymyOL-QhCS2DyS2bw-1; Fri, 28 Apr 2023 14:30:48 -0400
X-MC-Unique: MUKaoymyOL-QhCS2DyS2bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so28384065e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682706647; x=1685298647;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/s7kj0Fm3Lz7GeGStOsZoK5fmFZ7rSy3F0/tHqUHWn8=;
 b=YKTF0UDcgdMwNs9i48Dhn5CYa2vibp/a6EcR28fRMaoO49ZM9+OQkq8p4dxwXivt6q
 la6VY8Kur3qRvpVcFohmpWu1httTEzRx0gpgKk/swSMUzoYPQLXigPQtqC17Jp7vtj0e
 FTZlgdM2SrCLWS6ffuQGZ7kMlo2mAPQ5lQHOWrSWsJ88lxqRgKMQWfA5i5+CwvLLhbTh
 eqrpypUmBlyfPQc56EzoAElxi2M8Iw7W8DNySqksFWZDkaTmbrZRIRPz/R83BYTRbJHH
 aS+l8zCZUl6BFAFwVa/oaP+eB2LsRFf1Pp8TnpMSPZWfUSRSu0KlQmx1e6XI+kuT/M7Q
 DoiA==
X-Gm-Message-State: AC+VfDy6g3deIuD11sga4nzAXWLcea5T1cOs7eVzcj0UDtMw/CyMkC3M
 pKz/BvR1lCoLa2NKQCLcRRXkldSIJws7zlDFHXIYOEyCQahwCZWgxUrm/sEpRybI7UEkdrbJu0g
 j/V5Wtn16KOTV/Gk=
X-Received: by 2002:a05:600c:2205:b0:3f1:6ead:34fe with SMTP id
 z5-20020a05600c220500b003f16ead34femr4937026wml.26.1682706647691; 
 Fri, 28 Apr 2023 11:30:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SD6v/MPItgo9biEctDsoZPnDahyukvIop66vfm4IpcJdS70JwUtPpD7q/IdJytsg20XsHhA==
X-Received: by 2002:a05:600c:2205:b0:3f1:6ead:34fe with SMTP id
 z5-20020a05600c220500b003f16ead34femr4937004wml.26.1682706647409; 
 Fri, 28 Apr 2023 11:30:47 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003f17a00c214sm24888429wmi.16.2023.04.28.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:30:46 -0700 (PDT)
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
Subject: Re: [PATCH 12/17] qapi: Rewrite parsing of doc comment section
 symbols and tags
In-Reply-To: <20230428105429.1687850-13-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:24 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-13-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:30:45 +0200
Message-ID: <87o7n76eqy.fsf@secure.mitica>
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
> To recognize a line starting with a section symbol and or tag, we
> first split it at the first space, then examine the part left of the
> space.  We can just as well examine the unsplit line, so do that.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

My python regexp kungfu is at the limit with this patch, so take it as
you wish.  I understand the intent (very good commit message) and "more
or less" how it is done.  Important words on the previous sentence are
"more or less".  O:-)


