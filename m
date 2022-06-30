Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7B561E78
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 16:54:47 +0200 (CEST)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6vZ7-00089P-OC
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 10:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vY0-0007R3-MR
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vXx-0005hG-9V
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 10:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656600812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rRkKOpm1+oHO3I1iyLsiwmWLXpGoXS+hPl+S1SK6Do=;
 b=P4t9TpglYRq4ayb2GhqPNaovhYtr8MceEvjrUkVgp8bG7NZam2l6k3IsPfl+5X27gsLNy7
 GJnxsNbP3oVcxOE0YSZd8D+4uL1b7khLN/wYdLW6qSdTgcV0dzgStm0YXEtmw3Sdw1bvEv
 vaR2vxIFxyWId7PkZc+G1KY6WYdyuo0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-OdZfGnKBP0CalF9uoqaYXQ-1; Thu, 30 Jun 2022 10:53:27 -0400
X-MC-Unique: OdZfGnKBP0CalF9uoqaYXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EC8A280D23C;
 Thu, 30 Jun 2022 14:53:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 173381121314;
 Thu, 30 Jun 2022 14:53:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF53321E690D; Thu, 30 Jun 2022 16:53:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: Felix xq =?utf-8?Q?Quei=C3=9Fner?= <xq@random-projects.net>,
 qemu-devel@nongnu.org, kraxel@redhat.com,  thuth@redhat.com
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
References: <20220627164404.12137-1-xq@random-projects.net>
 <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com>
Date: Thu, 30 Jun 2022 16:53:25 +0200
In-Reply-To: <b7546847-d46a-b62c-f5ff-bd851a8e6ebc@redhat.com> (Hanna Reitz's
 message of "Thu, 30 Jun 2022 16:09:45 +0200")
Message-ID: <87h7425hju.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hanna Reitz <hreitz@redhat.com> writes:

> Hi,
>
> (Thanks for the patch!)
>
> On 27.06.22 18:44, Felix xq Quei=C3=9Fner wrote:
>> The patch adds "show_tabs" command line option for GTK ui similar to "gr=
ab_on_hover". This option allows tabbed view mode to not have to be enabled=
 by hand at each start of the VM.
>
> I=E2=80=99m not sure we have a hard rule on it, but I think generally com=
mit messages should be wrapped at 72 characters.

Yes, please.

[...]


