Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1414919
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 13:43:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNc1e-00032K-Gg
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 07:43:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNc0Y-0002jE-Ja
	for qemu-devel@nongnu.org; Mon, 06 May 2019 07:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNc0W-0003sk-UJ
	for qemu-devel@nongnu.org; Mon, 06 May 2019 07:42:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hNc0W-0003sH-Mw
	for qemu-devel@nongnu.org; Mon, 06 May 2019 07:42:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 724B4AC08E;
	Mon,  6 May 2019 11:42:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 227EC5C239;
	Mon,  6 May 2019 11:42:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 956741132B35; Mon,  6 May 2019 13:42:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190419061429.17695-1-ehabkost@redhat.com>
	<20190419061429.17695-6-ehabkost@redhat.com>
Date: Mon, 06 May 2019 13:42:04 +0200
In-Reply-To: <20190419061429.17695-6-ehabkost@redhat.com> (Eduardo Habkost's
	message of "Fri, 19 Apr 2019 03:14:27 -0300")
Message-ID: <87pnovrer7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 06 May 2019 11:42:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 5/7] cpu: Let architectures set CPU class
 name format
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Instead of requiring every architecture to implement a
> class_by_name function, let them set a format string at
> CPUClass::class_name_format.
>
> This will let us get rid of at least 16 class_by_name functions
> in the next commits.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/qom/cpu.h | 12 ++++++++++++
>  qom/cpu.c         | 18 ++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index fefd5c26b0..eda6a46b82 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -163,7 +163,19 @@ typedef struct CPUClass {
>      DeviceClass parent_class;
>      /*< public >*/
>  
> +    /* The following fields configure CPU model name -> QOM type translation: */
> +
> +    /*
> +     * arch-specific CPU model -> QOM type translation function.
> +     * Optional if @class_name_format is set.
> +     */
>      ObjectClass *(*class_by_name)(const char *cpu_model);
> +    /*
> +     * Format string for g_strdup_printf(), used to generate the CPU
> +     * class name.

Please document acceptable conversion specifiers.

> +     */
> +    const char *class_name_format;
> +
>      void (*parse_features)(const char *typename, char *str, Error **errp);
>  
>      void (*reset)(CPUState *cpu);
> diff --git a/qom/cpu.c b/qom/cpu.c
> index b971a56242..1fa64941b6 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -286,9 +286,23 @@ static bool cpu_common_has_work(CPUState *cs)
>  CPUClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>  {
>      CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> +    ObjectClass *oc;
> +    char *class_name;
>  
> -    assert(cpu_model && cc->class_by_name);
> -    return CPU_CLASS(cc->class_by_name(cpu_model));
> +    assert(cpu_model);
> +    if (cc->class_by_name) {
> +        return CPU_CLASS(cc->class_by_name(cpu_model));
> +    }
> +
> +    assert(cc->class_name_format);
> +    class_name = g_strdup_printf(cc->class_name_format, cpu_model);

Defeats -Wformat.  Triggers -Wformat-nonliteral, which we don't use, I
presume.  Observation, not objection.

cc->class_name_format must contain exactly one conversion specifier,
which must take a char *.

> +    oc = object_class_by_name(class_name);
> +    g_free(class_name);
> +    if (!oc || !object_class_dynamic_cast(oc, typename) ||
> +        object_class_is_abstract(oc)) {
> +        return NULL;
> +    }
> +    return CPU_CLASS(oc);
>  }
>  
>  static void cpu_common_parse_features(const char *typename, char *features,

